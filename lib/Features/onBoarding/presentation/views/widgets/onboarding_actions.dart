import 'package:flutter/material.dart';
import 'package:mauritania/core/constants/unified_button.dart';

import 'onboarding_constants.dart';


class OnboardingActions extends StatelessWidget {
  const OnboardingActions({
    super.key,
    required this.onBoardController,
    required this.isLast,
  });

  final PageController onBoardController;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return UnifiedButton(
      title: isLast ? 'إنهاء' : 'التالي',
      onPressed: () {
        onBoardController.nextPage(
            duration: const Duration(milliseconds: 600),
            curve: Curves.fastEaseInToSlowEaseOut);
        if (isLast == true) {
          submit(context);
        }
      },
    );
  }
}