import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter/widgets.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  // Public filter values
  List<int> selectedCategories = [];
  int selectedSortIndex = 0;
  RangeValues selectedRange = const RangeValues(125, 500);

  FilterCubit() : super(FilterInitial());

  // Method to update selected category
  void selectCategory(int categoryIndex, bool isSelected) {
    if (isSelected) {
      selectedCategories.add(categoryIndex);
    } else {
      selectedCategories.remove(categoryIndex);
    }
    emit(FilterUpdated());
  }

  // Method to update sort index
  void selectSort(int index) {
    selectedSortIndex = index;
    emit(FilterUpdated());
  }

  // Method to update price range
  void updatePriceRange(RangeValues range) {
    selectedRange = range;
    emit(FilterUpdated());
  }

  // Apply filter logic
  void applyFilter() {
    print("Filter applied with: selectedCategories: $selectedCategories, selectedSortIndex: $selectedSortIndex, selectedRange: $selectedRange");
  }
}
