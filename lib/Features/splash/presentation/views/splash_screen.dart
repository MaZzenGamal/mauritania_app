import 'package:flutter/material.dart';
import 'package:mauritania/Features/login/presentation/views/login_screen.dart';
import 'package:mauritania/core/theme/colors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       color: ColorsManager.primary,
        width: double.infinity,
        height: double.infinity,
        child: Center(child: Text('Splash سبلاش', style: TextStyle(color: Colors.white, fontSize: 24),)),
      ),
    );
  }
}
