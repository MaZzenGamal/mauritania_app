import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauritania/core/constants/unified_button.dart';
import 'package:mauritania/core/theme/colors.dart';

import '../../controller/filter_cubit/filter_cubit.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  final List<String> categories = const [
    "الكل",
    "سيارات",
    "إلكترونيات",
    "عقارات",
    "ملابس",
    "أثاث",
    "أجهزة منزلية"
  ];

  final List<String> sortOptions = const [
    'من الأرخص الى الأغلى',
    'الأكثر تقييماً',
    'الأكثر مبيعاً'
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
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
            const Text('الأقسام',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              children: List.generate(categories.length, (index) {
                final isSelected = context
                    .read<FilterCubit>()
                    .selectedCategories
                    .contains(index);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: ChoiceChip(
                    label: Text(categories[index]),
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

  Widget _buildSortSection() {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('الترتيب',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              children: List.generate(sortOptions.length, (index) {
                final isSelected =
                    context.read<FilterCubit>().selectedSortIndex == index;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
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
