import 'package:flutter/material.dart';
import 'package:mauritania/Features/register/presentation/views/widgets/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: RegisterScreenBody()),
    );
  }
}
