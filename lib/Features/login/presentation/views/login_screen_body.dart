import 'package:flutter/material.dart';
import 'package:mauritania/Features/login/presentation/views/widgets/login_switcher.dart';
import 'package:mauritania/Features/login/presentation/views/widgets/social_login_section.dart';
import 'package:mauritania/Features/register/presentation/views/register_screen.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'تسجيل الدخول',
              style: TextStyles.extraBold_24,
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'سجل دخولك من اجل الاستمرار في استخدام التطبيق',
              style: TextStyles.bold_14,
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(height: 16),
          const LoginSwitcher(),
          SocialLoginSection(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ليس لديك حساب؟ ',
                style: TextStyles.regular_14,
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                child: Text(
                  'إنشاء حساب',
                  style: TextStyles.regular_14.copyWith(
                    color: ColorsManager.primary,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Semantics(
            label: 'تخطي وتسجيل الدخول لاحقاً',
            child: InkWell(
              onTap: () {
                // TODO: Implement skip and login later functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'تم تخطي تسجيل الدخول',
                      style: TextStyles.regular_14.copyWith(color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                    backgroundColor: ColorsManager.primary,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      'تخطي وتسجيل الدخول لاحقاً',
                      style: TextStyles.regular_14.copyWith(
                        color: ColorsManager.primary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward,
                      color: ColorsManager.primary,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}