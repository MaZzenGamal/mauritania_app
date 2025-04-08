import 'package:flutter/material.dart';
import '../theme/colors.dart';

class UnifiedFormField extends StatelessWidget {
  const UnifiedFormField({
    super.key,
    this.label,
    this.hint,
    this.prefix,
    this.validator,
    this.controller,
    this.obscureText = false,
  });

  final String? label;
  final String? hint;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        style: const TextStyle(color: ColorsManager.primaryDark),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: ColorsManager.primaryDark),
          hintText: hint,
          hintStyle: const TextStyle(color:  Colors.black38),
          prefixIcon: prefix != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: prefix,
                )
              : null,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
