import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mauritania/core/constants/unified_form_field.dart';

import '../../../../notifications/presentation/views/notifications_screen.dart';
import 'support_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const NotificationsScreen();
                  }));
                },
                padding: EdgeInsets.zero,
                icon: const Icon(
                  FluentIcons.alert_24_regular,
                  size: 35,
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: UnifiedFormField(
              hint: 'اكتب كلمة البحث...',
              suffix: const Icon(
                FluentIcons.search_48_regular,
                color: Colors.black38,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SupportScreen();
              }));
            },
            icon: const Icon(
              FluentIcons.person_support_24_regular,
              size: 30,
            ),
            tooltip: 'Contact Support',
          ),
          const SizedBox(width: 16),
          const Text(
            'Logo',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}