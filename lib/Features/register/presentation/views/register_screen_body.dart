import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/unified_button.dart';
import '../../../../core/constants/unified_form_field.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Text('انشاء حساب', style: TextStyles.extraBold_24),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(FluentIcons.arrow_right_24_regular),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child:
                  Text('قم بإدخال معلوماتك الشخصية', style: TextStyles.bold_14),
            ),
            const SizedBox(height: 16),
            Text('الاسم الكامل', style: TextStyles.bold_15),
            const SizedBox(height: 12),
            UnifiedFormField(
              hint: 'ادخل اسمك الكامل',
              prefix:
                  Icon(FluentIcons.person_24_regular, color: Colors.black38),
            ),
            const SizedBox(height: 24),
            Text('رقم الهاتف', style: TextStyles.bold_15),
            const SizedBox(height: 12),
            UnifiedFormField(
              hint: 'ادخل رقم الهاتف',
              prefix: Icon(FluentIcons.phone_24_regular, color: Colors.black38),
            ),
            const SizedBox(height: 24),
            Text('البريد الإلكتروني', style: TextStyles.bold_15),
            const SizedBox(height: 12),
            UnifiedFormField(
              hint: 'ادخل بريدك الالكتروني',
              prefix: Icon(FluentIcons.mail_24_regular, color: Colors.black38),
            ),
            const SizedBox(height: 24),
            Text('كلمة المرور', style: TextStyles.bold_15),
            const SizedBox(height: 12),
            UnifiedFormField(
              hint: 'قم بإدخال كلمة المرور',
              prefix: Icon(FluentIcons.lock_closed_24_regular,
                  color: Colors.black38),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            Text('تأكيد كلمة المرور', style: TextStyles.bold_15),
            const SizedBox(height: 12),
            UnifiedFormField(
              hint: 'قم بتأكيد كلمة المرور',
              prefix: Icon(FluentIcons.lock_closed_24_regular,
                  color: Colors.black38),
              obscureText: true,
            ),
            const SizedBox(height: 36),
            UnifiedButton(
              onPressed: () {

              },
              title: 'انشاء حساب',
              isFullWidth: true,
              color: ColorsManager.primary,
            ),
            const SizedBox(height: 24),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('لديك حساب بالفعل؟ ', style: TextStyles.regular_14),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyles.regular_14.copyWith(
                        color: ColorsManager.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
