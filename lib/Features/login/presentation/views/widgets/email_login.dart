import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/unified_button.dart';
import '../../../../../core/constants/unified_form_field.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';

class EmailLogin extends StatelessWidget {
  const EmailLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'البريد الإلكتروني',
          style: TextStyles.bold_15,
        ),
        const SizedBox(
          height: 12,
        ),
        UnifiedFormField(
          hint: 'ادخل بريدك الالكتروني',
          prefix: Icon(FluentIcons.mail_24_regular, color: Colors.black38),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          'كلمة المرور',
          style: TextStyles.bold_15,
        ),
        const SizedBox(
          height: 12,
        ),
        UnifiedFormField(
          hint: 'قم بإدخال كلمة المرور',
          prefix:
              Icon(FluentIcons.lock_closed_24_regular, color: Colors.black38),
          obscureText: true,
        ),
        SizedBox(height: 14,),
        Text(
          'نسيت كلمة المرور؟',
          style: TextStyles.bold_14.copyWith(color: ColorsManager.primary),
        ),
        const SizedBox(
          height: 28,
        ),
        UnifiedButton(
          onPressed: () {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => PopScope(
            //       canPop:  false,
            //       child: const BotNavBar(),
            //     ),
            //   ),
            // );
          },
          title: 'تسجيل الدخول',
          isFullWidth: true,
          color: ColorsManager.primary,
        ),
      ],
    );
  }
}
