import 'package:flutter/material.dart';
import 'package:mauritania/Features/onBoarding/presentation/views/widgets/onboarding_screen_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: const OnboardingScreenBody()),
    );
  }
}
