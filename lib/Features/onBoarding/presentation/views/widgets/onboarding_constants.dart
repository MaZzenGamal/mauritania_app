

import 'package:flutter/cupertino.dart';
import 'package:mauritania/Features/botNavBar/presentation/views/botNavBar_screen.dart';
import 'package:mauritania/Features/login/presentation/views/login_screen.dart';

import '../../../../../core/local/cash_helper.dart';
import '../../../../../generated/assets.dart';
import '../../../data/model/onboarding_model.dart';

bool onBoarding = CashHelper.getData(key: 'onBoarding') ?? false;

final List<OnboardingModel> onBoardingItems = [
  OnboardingModel(
      image: Assets.imagesOnboarding1,
      content: 'قم بشراء أو بيع أو استبدال أي عنصر بسهولة وسرعة.',
  ),
  OnboardingModel(
      image: Assets.imagesOnboarding2,
      content:
      'اتصل بالمعلن أو تواصل معه مباشرة عبر الدردشة داخل التطبيق, بسهولة وأمان.',
    ),
  OnboardingModel(
      image: Assets.imagesOnboarding3,
      content:
      'تصفح فئات تطبيق سوقنا بكل سرعة وسلاسة, وابحث عن ما تحتاجه بسهولة تامة.',
      ),
];

void submit(context) {
 // CashHelper.saveData(key: 'onBoarding', value: true).then((value) {
    //if (value) {
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 250),
          reverseTransitionDuration: const Duration(milliseconds: 250),
          pageBuilder: (context, animation, secondaryAnimation) =>
              FadeTransition(
                opacity: animation,
                child: LoginScreen(),
              ),
        ),
            (Route<dynamic> route) => false,
      );
 //   }
 // }
 // );
}
