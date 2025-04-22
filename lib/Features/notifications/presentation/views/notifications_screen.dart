import 'package:flutter/material.dart';
import 'package:mauritania/Features/notifications/presentation/views/widgets/notifications_screen_body.dart';
import 'package:mauritania/core/theme/colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('الإشعارات'),
        backgroundColor: ColorsManager.primary,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: NotificationsScreenBody(),
    );
  }
}
