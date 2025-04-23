import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';

class CategoryBottomSheet extends StatefulWidget {
  final List<String> categories;
  final String? selectedCategory;
  final Function(String) onCategorySelected;

  const CategoryBottomSheet({
    super.key,
    required this.categories,
    this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  _CategoryBottomSheetState createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredCategories = widget.categories
        .where((category) => category.contains(_searchQuery))
        .toList();

    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: ColorsManager.grey400,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'اختر الفئة',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorsManager.primaryDark,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'بحث...',
                prefixIcon: const Icon(Icons.search, color: ColorsManager.grey600),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: ColorsManager.primary40),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: ColorsManager.primary, width: 2),
                ),
                filled: true,
                fillColor: ColorsManager.grey100,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintStyle: const TextStyle(color: ColorsManager.grey600),
              ),
              style: const TextStyle(color: ColorsManager.grey900),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                final category = filteredCategories[index];
                return InkWell(
                  onTap: () {
                    widget.onCategorySelected(category);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: ColorsManager.grey200, width: 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.selectedCategory == category)
                          const Icon(Icons.check, color: ColorsManager.primary),
                        Expanded(
                          child: Text(
                            category,
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: ColorsManager.grey900),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    foregroundColor: ColorsManager.primary70,
                  ),
                  child: const Text('إلغاء'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}