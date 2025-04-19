part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileEditing extends ProfileState {}

class ProfileSaved extends ProfileState {}

class NotificationsToggled extends ProfileState {}
