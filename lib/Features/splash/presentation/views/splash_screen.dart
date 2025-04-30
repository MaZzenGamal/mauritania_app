import 'package:flutter/material.dart';
import 'package:mauritania/Features/language/presentation/views/language_selection_screen.dart';
import 'package:mauritania/Features/login/presentation/views/login_screen.dart';
import 'package:mauritania/Features/onBoarding/presentation/views/onboarding_screen.dart';
import 'package:mauritania/core/theme/colors.dart';

import '../../../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen(
      {super.key,
      required this.onLanguageChanged,
      required this.currentLocale});

  final Function(Locale) onLanguageChanged;
  final Locale currentLocale;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LanguageSelectionScreen(
                  onLanguageChanged: widget.onLanguageChanged,
                  currentLocale: widget.currentLocale)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsManager.primary,
        width: double.infinity,
        height: double.infinity,
        child: Center(child: Image.asset(Assets.iconsLogoLight)),
      ),
    );
  }
}
