import 'package:flutter/material.dart';
import 'package:mauritania/Features/chat/presentation/views/chat_screen_body.dart';

import '../../../../core/theme/colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        backgroundColor: ColorsManager.primary,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      backgroundColor: ColorsManager.grey100,
      body: const SafeArea(
        child: ChatScreenBody(),
      ),
    );
  }
}
