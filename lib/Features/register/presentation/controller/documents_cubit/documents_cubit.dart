import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'documents_state.dart';

class DocumentsCubit extends Cubit<DocumentsState> {
  DocumentsCubit() : super(DocumentsInitial());

  File? profileImage;
  File? nationalIdImage;

  Future<void> pickImage(bool isProfile) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      if (isProfile) {
        setProfileImage(file);
      } else {
        setNationalIdImage(file);
      }
    }
  }

  void setProfileImage(File file) {
    profileImage = file;
    emit(ProfileSuccessState());
  }

  void setNationalIdImage(File file) {
    nationalIdImage = file;
    emit(IdSuccessState());
  }

  bool get isBothSelected => profileImage != null && nationalIdImage != null;

  void resetProfile() {
    profileImage = null;
    emit(ResetProfileState());
  }

  void resetNationalId() {
    nationalIdImage = null;
    emit(ResetIdState());
  }
}
