
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/constants/app_constants.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  String? selectedLocation;
  List<String> availableCities = [];
  String? selectedCity;

  PostCubit() : super(PostInitial());

  void selectLocation(String location) {
    selectedLocation = location;
    availableCities = AppConstants.locationsWithCities[location] ?? [];
    selectedCity = null; // Reset city when location changes
    emit(LocationUpdateState());
  }

  void selectCity(String city) {
    selectedCity = city;
    emit(CityUpdateState());
  }

  String? selectedCategory ;
  void selectCategory(String category) {
    selectedCategory = category;
    emit(CategoryUpdateState());
  }

  List<String> imageUrls = [];

  void addImage(String image) {
    imageUrls.add(image);
    emit(AddImageState());
  }

  void removeImage(int index) {
    imageUrls.removeAt(index);
    emit(RemoveImageState());
  }




}