import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';

class CategoryField extends StatelessWidget {
  final String? selectedCategory;
  final VoidCallback onTap;

  const CategoryField({super.key, required this.selectedCategory, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child:  Row(
            children: [
              Text(
                'اختر الفئة',
                style: TextStyle(
                  color: ColorsManager.primaryDark,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
                Text(
                  ' *',
                  style: TextStyle(
                    color: ColorsManager.accentDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedCategory == null
                    ? ColorsManager.primary40
                    : ColorsManager.primaryOpacity20,
                width: 1.5
              ),
              borderRadius: BorderRadius.circular(50),
              color: ColorsManager.primary10,
              boxShadow: [
                BoxShadow(
                  color: ColorsManager.grey900.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),

                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.category,
                  color: selectedCategory == null ? ColorsManager.grey600 : ColorsManager.primary70,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      selectedCategory ?? 'اختر الفئة',
                      style: TextStyle(
                        color: selectedCategory == null ? ColorsManager.grey600 : ColorsManager.grey900,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: ColorsManager.primary70,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}