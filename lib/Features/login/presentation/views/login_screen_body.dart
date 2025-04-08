import 'package:flutter/material.dart';
import 'package:mauritania/Features/login/presentation/views/widgets/login_switcher.dart';

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
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'تسجيل الدخول',
              style: TextStyles.extraBold_24,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'سجل دخولك من اجل الاستمرار في استخدام التطبيق',
              style: TextStyles.bold_14,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const LoginSwitcher(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ليس لديك حساب؟ ',
                style: TextStyles.regular_14,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context,  MaterialPageRoute(
                  //   builder: (context) => const BotNavBar(),
                  // ));
                },
                child: Text(
                  'إنشاء حساب',
                  style: TextStyles.regular_14.copyWith(
                      color: ColorsManager.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
