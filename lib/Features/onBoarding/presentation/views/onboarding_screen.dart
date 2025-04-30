import 'package:flutter/material.dart';
import 'package:mauritania/Features/onBoarding/presentation/views/widgets/onboarding_screen_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: const OnboardingScreenBody(),
    );
  }
}
