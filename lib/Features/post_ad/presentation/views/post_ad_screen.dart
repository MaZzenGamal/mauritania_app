import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauritania/Features/post_ad/presentation/controllers/post/post_cubit.dart';
import 'package:mauritania/Features/post_ad/presentation/views/post_ad_screen_body.dart';

class PostAdScreen extends StatelessWidget {
  const PostAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: Scaffold(
        body: SafeArea(child: PostAdScreenBody()),
      ),
    );
  }
}
