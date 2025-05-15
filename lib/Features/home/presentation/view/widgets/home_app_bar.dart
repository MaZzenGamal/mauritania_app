import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mauritania/core/constants/unified_form_field.dart';

import '../../../../../generated/assets.dart';
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
          Image.asset(Assets.iconsLogoGreen,scale: 10,),
          Expanded(
            child: UnifiedFormField(
              hint: 'إبحث في سوقنا…',

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
                  size: 30,
                ),
              ),
              Positioned(
                right: 11,
                top: 11,
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
        ],
      ),
    );
  }
}