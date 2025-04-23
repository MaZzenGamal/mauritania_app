import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/unified_button.dart';
import '../../../../../core/theme/colors.dart';


class SubmitButton extends StatelessWidget {
  final bool isSubmitting;
  final bool isEnabled;
  final VoidCallback onPressed;

  const SubmitButton({
    super.key,
    required this.isSubmitting,
    required this.isEnabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return UnifiedButton(
      onPressed: onPressed,
      title: 'نشر الإعلان',
      icon: FluentIcons.send_24_filled,
      isFullWidth: true,
      color: ColorsManager.primary50,
      textColor: Colors.white,
      iconColor: Colors.white,
      disabled: isSubmitting || !isEnabled,
      loading: isSubmitting,
      height: 56,
      elevation: 3,
      iconSize: 20,
      iconPadding: 8,
    );
  }
}