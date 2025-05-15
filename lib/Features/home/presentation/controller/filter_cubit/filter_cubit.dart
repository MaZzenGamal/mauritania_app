import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../../../core/constants/app_constants.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  List<int> selectedCategories = [];
  int selectedSortIndex = 0;
  RangeValues selectedRange = const RangeValues(125, 500);
  int selectedCityIndex = -1;

  String? selectedLocation;
  List<String> availableCities = [];

  FilterCubit() : super(FilterInitial());

  void selectCategory(int categoryIndex, bool isSelected) {
    if (isSelected) {
      selectedCategories.add(categoryIndex);
    } else {
      selectedCategories.remove(categoryIndex);
    }
    emit(FilterUpdated());
  }

  void selectSort(int index) {
    selectedSortIndex = index;
    emit(FilterUpdated());
  }

  void selectLocation(String location) {
    selectedLocation = location;
    availableCities = AppConstants.locationsWithCities[location] ?? [];
    selectedCityIndex = -1;
    emit(FilterUpdated());
  }

  void selectCity(int index) {
    selectedCityIndex = index;
    emit(FilterUpdated());
  }

  void updatePriceRange(RangeValues range) {
    selectedRange = range;
    emit(FilterUpdated());
  }

  void applyFilter() {
    final selectedCityName = availableCities.isNotEmpty && selectedCityIndex >= 0
        ? availableCities[selectedCityIndex]
        : null;

    print("Filter applied with: selectedCategories: $selectedCategories, "
        "selectedSortIndex: $selectedSortIndex, selectedRange: $selectedRange, "
        "selectedLocation: $selectedLocation, selectedCity: $selectedCityName");
  }
}
