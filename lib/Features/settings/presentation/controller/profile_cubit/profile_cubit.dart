import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void toggleEdit() {
    if (state is ProfileEditing) {
      emit(ProfileInitial());
    } else {
      emit(ProfileEditing());
    }
  }

  void saveProfile() {
    emit(ProfileSaved());
    emit(ProfileInitial());
  }

  void toggleNotifications() {
    emit(NotificationsToggled());
    emit(ProfileEditing());
  }
}
