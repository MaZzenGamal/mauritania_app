import 'package:flutter/material.dart';
import 'package:mauritania/Features/login/presentation/views/widgets/email_login.dart';
import 'package:mauritania/Features/login/presentation/views/widgets/phone_login.dart';
import 'package:mauritania/core/theme/styles.dart';
import '../../../../../core/constants/unified_form_field.dart';
import '../../../../../core/theme/colors.dart';

class LoginSwitcher extends StatelessWidget {
  const LoginSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              labelColor: ColorsManager.primary,
              unselectedLabelColor: Colors.grey,
              indicatorColor: ColorsManager.primary,
              indicatorWeight: 2,
              labelStyle: TextStyles.bold_14,
              dividerHeight: 0,
              dividerColor:  Colors.grey,
              padding:  const EdgeInsets.symmetric(horizontal: 16),
              tabs: const [
                Tab(text: 'رقم الهاتف'),
                Tab(text: 'البريد الالكتروني'),
              ],
            ),
            const SizedBox(height: 24), // Space between TabBar and TabBarView
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.68,
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0), // Padding around PhoneLogin widget
                    child: PhoneLogin(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0), // Padding around EmailLogin widget
                    child: EmailLogin(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
