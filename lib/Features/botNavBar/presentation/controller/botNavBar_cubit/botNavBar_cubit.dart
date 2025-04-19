import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauritania/Features/favourites/presentation/views/favourites_screen.dart';
import 'package:mauritania/Features/home/presentation/view/home_screen.dart';
import 'package:mauritania/Features/orders/presentation/views/orders_screen.dart';


import '../../../../settings/presentation/views/settings_screen.dart';

part 'botNavBar_state.dart';

class BotNavBarCubit extends Cubit<BotNavBarState> {
  BotNavBarCubit() : super(BotNavBarInitial());

  static BotNavBarCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> screens = [
    const HomeScreen(),
    const FavouritesScreen(),
    const OrdersScreen(),
    const SettingsScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(BotNavBarChangeState());
  }
}
