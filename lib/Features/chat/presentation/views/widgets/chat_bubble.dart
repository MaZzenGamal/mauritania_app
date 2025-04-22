import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String time;
  final String status;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isMe,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isMe ? ColorsManager.primary50 : ColorsManager.grey200,
          borderRadius: BorderRadius.circular(20).copyWith(
            bottomRight: isMe ? const Radius.circular(4) : const Radius.circular(20),
            bottomLeft: isMe ? const Radius.circular(20) : const Radius.circular(4),
          ),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.grey400.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isMe ? Colors.white : ColorsManager.grey900,
                fontSize: 16,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    color: isMe ? ColorsManager.primary10 : ColorsManager.grey600,
                    fontSize: 12,
                  ),
                ),
                if (isMe) ...[
                  const SizedBox(width: 8),
                  Icon(
                    status == 'read' ? Icons.done_all : Icons.done,
                    size: 16,
                    color: status == 'read' ? ColorsManager.primary10 : ColorsManager.grey600,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}