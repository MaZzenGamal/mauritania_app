import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/colors.dart';

class UnifiedFormField extends StatefulWidget {
  const UnifiedFormField({
    super.key,
    this.label,
    this.hint,
    this.text,
    this.prefix,
    this.suffix,
    this.prefixText,
    this.suffixText,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.readOnly = false,
    this.isRequired = false,
    this.minLines = 1,
    this.maxLines,
    this.maxLength,
    this.keyboardType,
    this.onChanged,
    this.backgroundColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.textDirection = TextDirection.rtl,
    this.inputFormatters,
  });

  final String? label;
  final String? hint;
  final String? text;
  final Widget? prefix;
  final Widget? suffix;
  final String? prefixText;
  final String? suffixText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final bool readOnly;
  final bool isRequired;
  final int minLines;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final TextDirection textDirection;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<UnifiedFormField> createState() => _UnifiedFormFieldState();
}

class _UnifiedFormFieldState extends State<UnifiedFormField> {
  late bool _obscure;
  final FocusNode _focusNode = FocusNode();
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      textField: true,
      label: widget.label,
      readOnly: widget.readOnly,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 20.0),
              child: Row(
                children: [
                  Text(
                    widget.label!,
                    style: TextStyle(
                      color: ColorsManager.primaryDark,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  if (widget.isRequired)
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? ColorsManager.grey100,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: _hasError
                    ? (widget.errorBorderColor ?? ColorsManager.accentDark)
                    : _focusNode.hasFocus && !widget.readOnly
                    ? (widget.focusedBorderColor ?? ColorsManager.primary)
                    : (widget.borderColor ?? ColorsManager.grey200),
                width: 1.5,
              ),
            ),
            child: TextFormField(
              controller: widget.controller,
              initialValue: widget.text,
              obscureText: _obscure,
              readOnly: widget.readOnly,
              validator: widget.readOnly ? null : (value) {
                final error = widget.validator?.call(value);
                setState(() {
                  _hasError = error != null;
                });
                return error;
              },
              onChanged: widget.readOnly ? null : widget.onChanged,
              focusNode: _focusNode,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              style: TextStyle(
                color: widget.readOnly ? ColorsManager.grey600 : ColorsManager.grey900,
              ),
              textAlignVertical: TextAlignVertical.top,
              minLines: widget.minLines,
              maxLines: widget.maxLines ?? (widget.minLines > 1 ? null : 1),
              maxLength: widget.maxLength,
              keyboardType: widget.keyboardType,
              textDirection: widget.textDirection,
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: const TextStyle(color: ColorsManager.grey600),
                isCollapsed: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
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
                prefixText: widget.prefixText,
                prefixStyle: const TextStyle(color: ColorsManager.grey900),
                suffixIcon: widget.obscureText
                    ? IconButton(
                  icon: AnimatedCrossFade(
                    firstChild: const Icon(
                      FluentIcons.eye_24_regular,
                      color: ColorsManager.grey600,
                    ),
                    secondChild: const Icon(
                      FluentIcons.eye_off_24_regular,
                      color: ColorsManager.grey600,
                    ),
                    crossFadeState: _obscure
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 200),
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
                suffixText: widget.suffixText,
                suffixStyle: const TextStyle(color: ColorsManager.grey900),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}