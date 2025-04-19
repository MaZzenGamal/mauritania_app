import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';

class SmartField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType keyboardType;
  final bool enabled;

  const SmartField({super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType,
      textAlign: TextAlign.right,
      style: TextStyle(color: enabled ? Colors.black87 : Colors.grey.shade600),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: enabled ? ColorsManager.primary50 : Colors.grey.shade500),
        prefixIcon: Icon(icon, color: enabled ? ColorsManager.primary50 : Colors.grey.shade500),
        filled: true,
        fillColor: enabled ? Colors.white : Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        if (keyboardType == TextInputType.emailAddress && !value.contains('@')) {
          return 'البريد الإلكتروني غير صالح';
        }
        return null;
      },
    );
  }
}