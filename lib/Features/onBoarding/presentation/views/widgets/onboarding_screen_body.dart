import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';
import 'onboarding_actions.dart';
import 'onboarding_constants.dart';
import 'onboarding_item.dart';


class OnboardingScreenBody extends StatefulWidget {
  const OnboardingScreenBody({super.key});

  @override
  State<OnboardingScreenBody> createState() => _OnboardingScreenBodyState();
}

class _OnboardingScreenBodyState extends State<OnboardingScreenBody> {
  var onBoardController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
           TextButton(
              onPressed: () {
                submit(context);
              },
              child:   Text(
                'تخطي',
                style: TextStyles.bold_18,
              )),
          Expanded(child: onboardingItemBuilder()),
          Align(
            alignment: Alignment.center,
            child: SmoothPageIndicator(
              controller: onBoardController,
              effect:  SwapEffect(
                radius: 7,
                dotHeight:10,
                dotWidth: 10,
                activeDotColor: Colors.grey,
                dotColor: ColorsManager.primary,
              ),
              count: onBoardingItems.length,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          OnboardingActions(
              onBoardController: onBoardController,
              isLast: isLast
          ),
          SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }

  PageView onboardingItemBuilder() {
    return PageView.builder(
      itemBuilder: (context, index) => OnboardingItem(
        onboardingModel: onBoardingItems[index],
      ),
      controller: onBoardController,
      itemCount: onBoardingItems.length,
      onPageChanged: (int index) {
        if (index == onBoardingItems.length - 1) {
          setState(() {
            isLast = true;
          });
        } else {
          setState(() {
            isLast = false;
          });
        }
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}


