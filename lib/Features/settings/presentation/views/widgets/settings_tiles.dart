import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mauritania/Features/settings/presentation/views/widgets/profile_screen.dart';
import 'package:mauritania/core/theme/colors.dart';

class SettingsTiles extends StatelessWidget {
  const SettingsTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.primary.withOpacity(0.05),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children:  [
          _SettingsTile(
              title: "معلوماتي",
              icon: FluentIcons.person_24_regular,
              onTap: (){
                customNavigator(context, const ProfileScreen());
              }),
          _SettingsTile(
              title: "الاشعارات",
              icon: FluentIcons.alert_24_regular,
              onTap: null),
          _SettingsTile(
              title: "تغيير كلمة المرور",
              icon: FluentIcons.lock_closed_24_regular,
              onTap: null),
          _SettingsTile(
              title: "السلة",
              icon: FluentIcons.shopping_bag_24_regular,
              onTap: null),
          _SettingsTile(
              title: "مجموع الرصيد",
              icon: FluentIcons.wallet_24_regular,
              onTap: null),
          _SettingsTile(
              title: "تسجيل الخروج",
              icon: FluentIcons.sign_out_24_regular,
              onTap: null),
        ],
      ),
    );
  }

  void customNavigator(BuildContext context, Widget screen) {
    Navigator.push(context,  MaterialPageRoute(
      builder: (context) =>  screen,
    ));
  }
}

class _SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const _SettingsTile(
      {required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        elevation: 0.8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          trailing: const Icon(FluentIcons.chevron_right_24_regular, size: 16),
          leading: Icon(icon, color: ColorsManager.primary),
          title: Text(title,
              textAlign: TextAlign.right, style: const TextStyle(fontSize: 14)),
          onTap: onTap,
        ),
      ),
    );
  }
}
