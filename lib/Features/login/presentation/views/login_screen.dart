import 'package:flutter/material.dart';
import 'package:mauritania/Features/login/presentation/views/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: LoginScreenBody()),
    );
  }
}
