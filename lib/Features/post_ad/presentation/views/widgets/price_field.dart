import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mauritania/core/constants/unified_form_field.dart';
import '../../../../../core/theme/colors.dart';

class PriceField extends StatelessWidget {
  final TextEditingController controller;

  const PriceField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return UnifiedFormField(
      controller: controller,
      label: 'السعر',
      hint: 'أدخل السعر (مثال: 99.99)',
      prefix: const Icon(FluentIcons.currency_dollar_euro_24_filled, color: ColorsManager.primary70),
      prefixText: 'ر.س ',
      validator: (value) => value!.isEmpty ? 'السعر مطلوب' : null,
      isRequired: true,
      maxLines: 1,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textDirection: TextDirection.rtl,
      backgroundColor: ColorsManager.primary10,
      borderColor: ColorsManager.primary40,
      focusedBorderColor: ColorsManager.primary,
      errorBorderColor: ColorsManager.accentDark,
    );
  }
}