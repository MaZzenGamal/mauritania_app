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
        return BottomNavigationBar(
          currentIndex: BotNavBarCubit
              .get(context)
              .currentIndex,
          onTap: (value) {
            BotNavBarCubit.get(context).changeIndex(value);
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            color: ColorsManager.primary,
            fontWeight: FontWeight.bold,
          ),
          selectedItemColor: ColorsManager.primary,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                FluentIcons.home_24_regular,
              ),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(FluentIcons.heart_24_regular),
              label: 'المفضلة',
            ),
            BottomNavigationBarItem(
              icon: Icon(FluentIcons.re_order_dots_vertical_24_regular),
              label: 'طلباتي',
            ),
            BottomNavigationBarItem(
              icon: Icon(FluentIcons.person_24_regular),
              label: 'البروفايل',
            ),
          ],
        );
      },
    );
  }
}
