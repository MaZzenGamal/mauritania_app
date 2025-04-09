part of 'botNavBar_cubit.dart';

@immutable
sealed class BotNavBarState {}

final class BotNavBarInitial extends BotNavBarState {}

final class BotNavBarChangeState extends BotNavBarState {}
