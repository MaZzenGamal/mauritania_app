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
    {'text': 'Hey, how are you?', 'isMe': false, 'time': '10:00 AM', 'status': 'read'},
    {'text': 'I\'m good! How about you?', 'isMe': true, 'time': '10:02 AM', 'status': 'read'},
    {'text': 'Doing great, thanks for asking!', 'isMe': false, 'time': '10:03 AM', 'status': 'read'},
    {'text': 'Any plans for the weekend?', 'isMe': true, 'time': '10:05 AM', 'status': 'sent'},
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
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.attach_file, color: ColorsManager.grey600),
                      onPressed: () {},
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