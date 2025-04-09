import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauritania/Features/botNavBar/presentation/controller/botNavBar_cubit/botNavBar_cubit.dart';
import 'package:mauritania/Features/botNavBar/presentation/views/widgets/botNavBar_widget.dart';

class BotNavBarScreen extends StatelessWidget {
  const BotNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BotNavBarCubit(),
      child: BlocBuilder<BotNavBarCubit, BotNavBarState>(
        builder: (context, state) {
          return Scaffold(
            key:  BotNavBarCubit.get(context).scaffoldKey,
            body: BotNavBarCubit.get(context)
                .screens[BotNavBarCubit.get(context).currentIndex],
            bottomNavigationBar: BotNavBarWidget(),
          );
        },
      ),
    );
  }
}
