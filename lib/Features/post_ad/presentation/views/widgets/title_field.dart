import 'package:flutter/material.dart';
import '../../../../../core/constants/unified_form_field.dart';
import '../../../../../core/theme/colors.dart';


class TitleField extends StatelessWidget {
  final TextEditingController controller;

  const TitleField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return UnifiedFormField(
      controller: controller,
      label: 'عنوان الإعلان',
      hint: 'أدخل عنوانًا جذابًا لإعلانك',
      prefix: const Icon(Icons.title, color: ColorsManager.primary70),
      validator: (value) => value!.isEmpty ? 'العنوان مطلوب' : null,
      isRequired: true,
      maxLines: 1,
      textDirection: TextDirection.rtl,
      backgroundColor: ColorsManager.primary10,
      borderColor: ColorsManager.primary40,
      focusedBorderColor: ColorsManager.primary,
      errorBorderColor: ColorsManager.accentDark,
    );
  }
}