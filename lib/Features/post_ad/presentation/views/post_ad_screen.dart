import 'package:flutter/material.dart';
import 'package:mauritania/Features/post_ad/presentation/views/post_ad_screen_body.dart';

class PostAdScreen extends StatelessWidget {
  const PostAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: PostAdScreenBody()),
    );
  }
}
