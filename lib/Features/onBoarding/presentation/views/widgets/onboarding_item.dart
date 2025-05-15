import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mauritania/core/theme/styles.dart';

import '../../../data/model/onboarding_model.dart';


class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.onboardingModel});

  final OnboardingModel onboardingModel ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          SvgPicture.asset(
            onboardingModel.image,
            height: 400,
            width: double.infinity,
          ),
          SizedBox(height:8,),
          Text(
            onboardingModel.content,
            style: TextStyles.regular_16.copyWith(color: Colors.grey),
            textAlign:  TextAlign.center,
          ),
        ],
      ),
    );
  }
}
