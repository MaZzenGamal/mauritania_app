

import 'package:flutter/cupertino.dart';
import 'package:mauritania/Features/botNavBar/presentation/views/botNavBar_screen.dart';
import 'package:mauritania/Features/login/presentation/views/login_screen.dart';

import '../../../../../core/local/cash_helper.dart';
import '../../../../../generated/assets.dart';
import '../../../data/model/onboarding_model.dart';

bool onBoarding = CashHelper.getData(key: 'onBoarding') ?? false;

final List<OnboardingModel> onBoardingItems = [
  OnboardingModel(
      image: Assets.imagesCar3,
      content: 'تستطيع التحكم في النشاطات الخاصة بك وتحديد الخطوات التي تريدها',
      title: 'الاخبار',
      body: 'handleWindowFocusChanged mWindowFocusChanged'),
  OnboardingModel(
      image: Assets.imagesCar2,
      content:
      'يحتوي التطبيق علي العديد من الاقسام الخاصة بك وتحديد الخطوات التي تريدها',
      title: 'التصفح',
      body: 'handleWindowFocusChanged mWindowFocusChanged'),
  OnboardingModel(
      image: Assets.imagesCar,
      content:
      ' يجمع بين كل المناسبات بشكل منظم يربط كل المناسبات بشكل منظم',
      title: 'المناسبات',
      body: 'handleWindowFocusChanged mWindowFocusChanged'),
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
