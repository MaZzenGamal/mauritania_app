import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';

class UnifiedButton extends StatelessWidget {
  const UnifiedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color,
    this.borderColor = ColorsManager.primary,
    this.textColor,
    this.isFullWidth = false,
    this.width,
    this.loading = false,
    this.disabled = false,
    this.isRounded = false,
    this.isOutlined = false,
    this.radius = 50,
    this.height,
    this.elevation = 0,
    this.textStyle,
    this.icon, // New optional icon parameter
    this.iconSize = 20, // Default icon size
    this.iconColor, // Optional icon color
    this.iconPadding = 8, // Space between icon and text
  });

  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final void Function() onPressed;
  final String title;
  final bool isFullWidth;
  final double? width;
  final double? height;
  final bool loading;
  final bool disabled;
  final bool isRounded;
  final bool isOutlined;
  final double radius;
  final double? elevation;
  final TextStyle? textStyle;
  final IconData? icon; // Icon to display before the title
  final double iconSize; // Size of the icon
  final Color? iconColor; // Color of the icon
  final double iconPadding; // Padding between icon and text

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFullWidth ? double.infinity : width,
      height: height ?? 50,
      decoration: isOutlined
          ? null
          : BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: _getButtonColor(),
      ),
      child: _parentWidget(
        !loading
            ? _buildContent()
            : LoadingIndicator(
          colors: const [Colors.white],
          indicatorType: Indicator.ballBeat,
          strokeWidth: 2,
        ),
        buttonStyle,
      ),
    );
  }

  Widget _buildContent() {
    if (icon == null) {
      return Text(
        title,
        style: textStyle ?? TextStyles.bold_15.copyWith(color: _getTextColor()),
        textAlign: TextAlign.center,
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor ?? _getTextColor(),
        ),
        SizedBox(width: iconPadding),
        Text(
          title,
          style: textStyle ?? TextStyles.bold_15.copyWith(color: _getTextColor()),
        ),
      ],
    );
  }

  Color _getTextColor() {
    if (disabled || loading) {
      return ColorsManager.surface.withOpacity(0.5);
    }
    return textColor ?? Colors.white;
  }

  ButtonStyle? get buttonStyle {
    if (isOutlined) {
      return OutlinedButton.styleFrom(
        elevation: elevation,
        side: BorderSide(color: borderColor ?? Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        disabledBackgroundColor: ColorsManager.surface.withOpacity(0.3),
      );
    }
    return ElevatedButton.styleFrom(
      elevation: elevation,
      backgroundColor: _getButtonColor(),
      foregroundColor: borderColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      disabledBackgroundColor: ColorsManager.surface.withOpacity(0.3),
    );
  }

  Color _getButtonColor() {
    if (disabled || loading) {
      return ColorsManager.primary.withOpacity(0.7);
    }
    return color ?? ColorsManager.primary;
  }

  Widget _parentWidget(Widget child, ButtonStyle? style) {
    if (isOutlined) {
      return OutlinedButton(
        onPressed: disabled || loading ? null : onPressed,
        style: style,
        child: child,
      );
    }
    return ElevatedButton(
      onPressed: disabled || loading ? null : onPressed,
      style: style,
      child: child,
    );
  }
}