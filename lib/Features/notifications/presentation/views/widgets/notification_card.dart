import 'package:flutter/material.dart';
import 'package:mauritania/core/theme/colors.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;

  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: ColorsManager.primary20,
          child: const Icon(Icons.notifications, color: ColorsManager.primary),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          message,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 14),
        ),
        trailing: Text(
          time,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
          ),
        ),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}
