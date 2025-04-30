import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/unified_form_field.dart';
import '../../../../../core/theme/colors.dart';


class DescriptionField extends StatelessWidget {
  final TextEditingController controller;

  const DescriptionField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return UnifiedFormField(
      controller: controller,
      label: 'الوصف',
      hint: 'صف منتجك أو خدمتك بالتفصيل',
      prefix: const Icon(FluentIcons.text_bullet_list_square_24_regular, color: ColorsManager.primary70),
      validator: (value) => value!.isEmpty ? 'الوصف مطلوب' : null,
      isRequired: true,
      maxLines: 10,
      textDirection: TextDirection.rtl,
      backgroundColor: ColorsManager.primary10,
      borderColor: ColorsManager.primary40,
      focusedBorderColor: ColorsManager.primary,
      errorBorderColor: ColorsManager.accentDark,
    );
  }
}