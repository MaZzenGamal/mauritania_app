import 'package:flutter/material.dart';
import 'package:mauritania/Features/settings/presentation/views/settings_screen_body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SettingsScreenBody()),
    );
  }
}
