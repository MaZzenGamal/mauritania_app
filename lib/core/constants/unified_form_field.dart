import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class UnifiedFormField extends StatefulWidget {
  const UnifiedFormField({
    super.key,
    this.label,
    this.hint,
    this.prefix,
    this.suffix,
    this.validator,
    this.controller,
    this.obscureText = false,
  });

  final String? label;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  State<UnifiedFormField> createState() => _UnifiedFormFieldState();
}

class _UnifiedFormFieldState extends State<UnifiedFormField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

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
        controller: widget.controller,
        obscureText: _obscure,
        validator: widget.validator,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        style: const TextStyle(color: ColorsManager.primaryDark),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(color: ColorsManager.primaryDark),
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Colors.black38),
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          prefixIcon: widget.prefix != null
              ? Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: widget.prefix,
          )
              : null,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
            icon: Icon(
              _obscure
                  ? FluentIcons.eye_24_regular
                  : FluentIcons.eye_off_24_regular,
              color: Colors.black38,
            ),
            onPressed: () {
              setState(() {
                _obscure = !_obscure;
              });
            },
          )
              : (widget.suffix != null
              ? Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: widget.suffix,
          )
              : null),
          suffixIconConstraints: const BoxConstraints(
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
