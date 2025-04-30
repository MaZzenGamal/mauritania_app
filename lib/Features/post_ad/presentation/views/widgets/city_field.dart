import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';

class CityField extends StatelessWidget {
  final String? selectedCity;
  final VoidCallback onTap;

  const CityField({super.key, required this.selectedCity, required this.onTap});

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
                'اختر المدينه',
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
                  color: selectedCity == null
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
                  FluentIcons.city_24_regular,
                  color: selectedCity == null ? ColorsManager.grey600 : ColorsManager.primary70,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      selectedCity ?? 'اختر المدينه',
                      style: TextStyle(
                        color: selectedCity == null ? ColorsManager.grey600 : ColorsManager.grey900,
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