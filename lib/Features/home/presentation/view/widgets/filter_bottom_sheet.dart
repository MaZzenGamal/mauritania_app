import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauritania/core/constants/app_constants.dart';
import 'package:mauritania/core/constants/unified_button.dart';
import 'package:mauritania/core/theme/colors.dart';

import '../../controller/filter_cubit/filter_cubit.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  final List<String> sortOptions = const [
    'من الأرخص الى الأغلى',
    'الأكثر تقييماً',
    'الأكثر مبيعاً'
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {},
          child: DraggableScrollableSheet(
            initialChildSize: 0.75,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return BlocProvider(
                create: (context) => FilterCubit(),
                child: BlocBuilder<FilterCubit, FilterState>(
                  builder: (context, state) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                'الفلترة',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildCategorySection(),
                            const SizedBox(height: 16),
                            _buildLocationSection(),
                            const SizedBox(height: 16),
                            _buildCitySection(),
                            const SizedBox(height: 16),
                            _buildSliderSection(),
                            const SizedBox(height: 16),
                            _buildSortSection(),
                            const SizedBox(height: 16),
                            UnifiedButton(
                              onPressed: () {
                                context.read<FilterCubit>().applyFilter();
                              },
                              title: 'تطبيق الفلترة',
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('الأقسام', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              children: List.generate(AppConstants.categories.length, (index) {
                final isSelected = context
                    .read<FilterCubit>()
                    .selectedCategories
                    .contains(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: ChoiceChip(
                    label: Text(AppConstants.categories[index]),
                    selected: isSelected,
                    selectedColor: ColorsManager.primary,
                    backgroundColor: Colors.grey[200],
                    checkmarkColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected
                            ? ColorsManager.primary
                            : Colors.grey[200]!,
                      ),
                    ),
                    labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey),
                    onSelected: (_) {
                      context
                          .read<FilterCubit>()
                          .selectCategory(index, !isSelected);
                    },
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLocationSection() {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        final cubit = context.read<FilterCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('الموقع', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) {
                    return LocationSelectionSheet(
                      locations: AppConstants.locationsWithCities.keys.toList(),
                      selectedLocation: cubit.selectedLocation,
                      onLocationSelected: (location) {
                        cubit.selectLocation(location);
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cubit.selectedLocation ?? 'اختر الموقع',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCitySection() {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        final cubit = context.read<FilterCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('المدينة', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: cubit.availableCities.isNotEmpty
                  ? () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) {
                    return CitySelectionSheet(
                      cities: cubit.availableCities,
                      selectedIndex: cubit.selectedCityIndex,
                      onCitySelected: (index) {
                        cubit.selectCity(index);
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              }
                  : null,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: cubit.availableCities.isNotEmpty
                          ? Colors.grey.shade300
                          : Colors.grey.shade100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cubit.selectedCityIndex >= 0 &&
                          cubit.availableCities.isNotEmpty
                          ? cubit.availableCities[cubit.selectedCityIndex]
                          : 'اختر المدينة',
                      style: TextStyle(
                        fontSize: 16,
                        color: cubit.availableCities.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: cubit.availableCities.isNotEmpty
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSortSection() {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('الترتيب', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              children: List.generate(sortOptions.length, (index) {
                final isSelected =
                    context.read<FilterCubit>().selectedSortIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: ChoiceChip(
                    label: Text(sortOptions[index]),
                    selected: isSelected,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected
                            ? ColorsManager.primary
                            : Colors.grey[200]!,
                      ),
                    ),
                    selectedColor: ColorsManager.primary,
                    checkmarkColor: Colors.white,
                    backgroundColor: Colors.grey[200],
                    labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey),
                    onSelected: (_) {
                      context.read<FilterCubit>().selectSort(index);
                    },
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSliderSection() {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('السعر', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            RangeSlider(
              values: context.read<FilterCubit>().selectedRange,
              min: 125,
              max: 500,
              divisions: 375,
              labels: RangeLabels(
                context
                    .read<FilterCubit>()
                    .selectedRange
                    .start
                    .round()
                    .toString(),
                context
                    .read<FilterCubit>()
                    .selectedRange
                    .end
                    .round()
                    .toString(),
              ),
              activeColor: ColorsManager.primary,
              onChanged: (RangeValues values) {
                context.read<FilterCubit>().updatePriceRange(values);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context
                    .read<FilterCubit>()
                    .selectedRange
                    .start
                    .round()
                    .toString()),
                Text(context
                    .read<FilterCubit>()
                    .selectedRange
                    .end
                    .round()
                    .toString()),
              ],
            ),
          ],
        );
      },
    );
  }
}

class CitySelectionSheet extends StatefulWidget {
  final List<String> cities;
  final int selectedIndex;
  final Function(int) onCitySelected;

  const CitySelectionSheet({
    super.key,
    required this.cities,
    required this.selectedIndex,
    required this.onCitySelected,
  });

  @override
  State<CitySelectionSheet> createState() => _CitySelectionSheetState();
}

class _CitySelectionSheetState extends State<CitySelectionSheet> {
  late List<String> filteredCities;
  String query = '';

  @override
  void initState() {
    super.initState();
    filteredCities = widget.cities;
  }

  void _search(String value) {
    setState(() {
      query = value;
      filteredCities = widget.cities
          .where((city) => city.contains(value))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16).copyWith(bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('اختر المدينة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              hintText: 'بحث...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              prefixIcon: const Icon(Icons.search),
            ),
            onChanged: _search,
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 300,
            child: filteredCities.isEmpty
                ? const Center(child: Text('لا توجد مدن متاحة'))
                : ListView.builder(
              itemCount: filteredCities.length,
              itemBuilder: (context, index) {
                final cityName = filteredCities[index];
                final originalIndex = widget.cities.indexOf(cityName);
                final isSelected = widget.selectedIndex == originalIndex;
                return ListTile(
                  title: Text(cityName),
                  trailing: isSelected
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () => widget.onCitySelected(originalIndex),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LocationSelectionSheet extends StatefulWidget {
  final List<String> locations;
  final String? selectedLocation;
  final Function(String) onLocationSelected;

  const LocationSelectionSheet({
    super.key,
    required this.locations,
    required this.selectedLocation,
    required this.onLocationSelected,
  });

  @override
  State<LocationSelectionSheet> createState() => _LocationSelectionSheetState();
}

class _LocationSelectionSheetState extends State<LocationSelectionSheet> {
  late List<String> filteredLocations;
  String query = '';

  @override
  void initState() {
    super.initState();
    filteredLocations = widget.locations;
  }

  void _search(String value) {
    setState(() {
      query = value;
      filteredLocations = widget.locations
          .where((location) => location.contains(value))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16).copyWith(bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'اختر الولاية',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              hintText: 'بحث...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              prefixIcon: const Icon(Icons.search),
            ),
            onChanged: _search,
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 300,
            child: filteredLocations.isEmpty
                ? const Center(child: Text('لا توجد ولايات متاحة'))
                : ListView.builder(
              itemCount: filteredLocations.length,
              itemBuilder: (context, index) {
                final location = filteredLocations[index];
                final isSelected = widget.selectedLocation == location;
                return ListTile(
                  title: Text(location),
                  trailing: isSelected
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () => widget.onLocationSelected(location),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}