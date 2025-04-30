import 'package:flutter/material.dart';
import 'package:mauritania/Features/chat/presentation/views/widgets/chat_bubble.dart';
import '../../../../core/theme/colors.dart';

class ChatScreenBody extends StatefulWidget {
  const ChatScreenBody({super.key});

  @override
  State<ChatScreenBody> createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [
    {'text': 'مرحبا، أنا مهتم، هل لا يزال متوفر؟', 'isMe': true, 'time': '10:00 AM', 'status': 'read'},
  ];
  bool _isTyping = false;

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _controller.text,
          'isMe': true,
          'time': TimeOfDay.now().format(context),
          'status': 'sent',
        });
        _controller.clear();
        _isTyping = false;
      });
      // Simulate receiver response
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _isTyping = true;
        });
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _isTyping = false;
            _messages.add({
              'text': 'Looks like fun!',
              'isMe': false,
              'time': TimeOfDay.now().format(context),
              'status': 'read',
            });
          });
          _scrollToBottom();
        });
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollToBottom();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Alert message as regular text
        Container(
          color: ColorsManager.accentLight,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'تنبيه هام: احرص على الحفاظ على خصوصيتك، لا ترسل أموالاً قبل التأكد من المنتج, لا تقم بفتح أي روابط تعتقد أنها مشبوهة وقابل البائع في مكان عام. سوقنا يهتم بسلامتك.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsManager.grey900,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: _messages.length + (_isTyping ? 1 : 0),
            itemBuilder: (context, index) {
              if (_isTyping && index == _messages.length) {
                return const TypingIndicator();
              }
              return ChatBubble(
                text: _messages[index]['text'],
                isMe: _messages[index]['isMe'],
                time: _messages[index]['time'],
                status: _messages[index]['status'],
              );
            },
          ),
        ),
        // Horizontal scrolling for suggested quick response messages
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _quickResponseButton('السلام عليكم'),
              _quickResponseButton('هل المنتج متوفر؟'),
              _quickResponseButton('مرحبا'),
              _quickResponseButton('احتاج مزيدا من التفاصيل'),
              _quickResponseButton('هل السعر قابل للتفاوض'),
            ],
          ),
        ),
        // Message input field and send button
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.surface,
            boxShadow: [
              BoxShadow(
                color: ColorsManager.grey400.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    hintStyle: TextStyle(color: ColorsManager.grey600),
                    filled: true,
                    fillColor: ColorsManager.grey100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  style: const TextStyle(color: ColorsManager.grey900),
                  onChanged: (value) {
                    setState(() {
                      _isTyping = value.trim().isNotEmpty;
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              FloatingActionButton(
                mini: true,
                backgroundColor: ColorsManager.accent,
                onPressed: _sendMessage,
                child: const Icon(Icons.send, color: Colors.white, size: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _quickResponseButton(String text) {
    return GestureDetector(
      onTap: () {
        _controller.text = text;
        _sendMessage();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: ColorsManager.grey200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text),
      ),
    );
  }
}

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ColorsManager.grey100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: ColorsManager.grey600,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: ColorsManager.grey600,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: ColorsManager.grey600,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
