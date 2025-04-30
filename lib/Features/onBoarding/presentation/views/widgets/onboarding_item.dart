import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mauritania/core/theme/styles.dart';

import '../../../data/model/onboarding_model.dart';


class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.onboardingModel});

  final OnboardingModel onboardingModel ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        Image.asset(
          onboardingModel.image,
          height: 400,
          width: double.infinity,
        ),
        SizedBox(height: 4,),
        Text(
          onboardingModel.title,
          style: TextStyles.bold_20,
        ),
        SizedBox(height:8,),
        Text(
          onboardingModel.content,
          style: TextStyles.regular_16.copyWith(color: Colors.grey),
          textAlign:  TextAlign.center,
        ),
      ],
    );
  }
}
