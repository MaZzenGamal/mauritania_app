import 'package:flutter/material.dart';

import 'notification_card.dart';

class NotificationsScreenBody extends StatelessWidget {
  const NotificationsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 10,
      itemBuilder: (context, index) {
        return NotificationCard(
          title: 'Notification ${index + 1}',
          message: 'This is a sample notification message.',
          time: '2h ago',
        );
      },
    );
  }
}