import 'package:flutter/material.dart';


import 'home_screen_body.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xFFFafafa),
      body: SafeArea(child: HomeScreenBody()),
    );
  }
}
