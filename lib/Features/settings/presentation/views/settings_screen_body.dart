import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mauritania/Features/settings/presentation/views/widgets/info_section.dart';
import 'package:mauritania/Features/settings/presentation/views/widgets/settings_tiles.dart';

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          InfoSection(),
          const SizedBox(height: 20),
          SettingsTiles()
        ],
      ),
    );
  }
}




