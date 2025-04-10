part of 'documents_cubit.dart';

@immutable
sealed class DocumentsState {}

final class DocumentsInitial extends DocumentsState {}

final class ProfileLoadingState extends DocumentsState {}

final class ProfileSuccessState extends DocumentsState {}

final class ProfileErrorState extends DocumentsState {
  final String error;

  ProfileErrorState(this.error);
}

final class IdLoadingState extends DocumentsState {}

final class IdSuccessState extends DocumentsState {}

final class IdErrorState extends DocumentsState {
  final String error;

  IdErrorState(this.error);
}

final class ResetProfileState extends DocumentsState {}

final class ResetIdState extends DocumentsState {}
