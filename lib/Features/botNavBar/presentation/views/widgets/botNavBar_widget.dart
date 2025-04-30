import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/colors.dart';
import '../../controller/botNavBar_cubit/botNavBar_cubit.dart';

class BotNavBarWidget extends StatelessWidget {
  const BotNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BotNavBarCubit, BotNavBarState>(
      builder: (context, state) {
        final cubit = BotNavBarCubit.get(context);
        return BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (value) {
            cubit.changeIndex(value);
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            color: ColorsManager.primary,
            fontWeight: FontWeight.bold,
          ),
          selectedItemColor: ColorsManager.primary,
          unselectedItemColor: Colors.grey,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(FluentIcons.home_24_regular),
              label: 'الرئيسية',
            ),
            const BottomNavigationBarItem(
              icon: Icon(FluentIcons.heart_24_regular),
              label: 'المفضلة',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorsManager.primary.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  FluentIcons.add_24_filled,
                  color: cubit.currentIndex == 2
                      ? ColorsManager.primary
                      : Colors.grey,
                ),
              ),
              label: 'إعلان',
            ),
            const BottomNavigationBarItem(
              icon: Icon(FluentIcons.chat_24_regular),
              label: 'الرسائل',
            ),
            const BottomNavigationBarItem(
              icon: Icon(FluentIcons.person_24_regular),
              label: 'الحساب',
            ),
          ],
        );
      },
    );
  }
}