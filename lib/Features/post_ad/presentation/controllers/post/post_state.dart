part of 'post_cubit.dart';

@immutable
sealed class PostState {}

class PostInitial extends PostState {}

class PostUpdatedState extends PostState {}

class LocationUpdateState extends PostState {}

class CityUpdateState extends PostState {}

class CategoryUpdateState extends PostState {}

class AddImageState extends PostState {}

class RemoveImageState extends PostState {}
