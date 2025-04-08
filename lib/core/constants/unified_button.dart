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
    this.radius,
    this.height,
    this.elevation = 0,
    this.textStyle,
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
  final double? radius;
  final double? elevation;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFullWidth ? double.infinity : width,
      height: height ?? 50,
      decoration: isOutlined
          ? null
          : BoxDecoration(
              gradient: color != null
                  ? null
                  : LinearGradient(
                      colors: disabled || loading
                          ? [
                              ColorsManager.surface.withOpacity(0.5),
                              ColorsManager.primary.withOpacity(0.5)
                            ]
                          : [ColorsManager.primary, ColorsManager.surface],
                      begin: AlignmentDirectional.topEnd,
                      end: AlignmentDirectional.bottomStart,
                    ),
              borderRadius: BorderRadius.circular(radius ?? 50),
              color: color,
            ),
      child: _parentWidget(
        !loading
            ? Text(
                title,
                style: textStyle ??
                    TextStyles.bold_15
                        .copyWith(color: textColor ?? (Colors.white)),
                textAlign: TextAlign.center,
              )
            : LoadingIndicator(
                colors: const [Colors.white],
                indicatorType: Indicator.ballBeat,
                strokeWidth: 2,
              ),
        buttonStyle,
      ),
    );
  }

  ButtonStyle? get buttonStyle {
    if (isOutlined) {
      return OutlinedButton.styleFrom(
        elevation: elevation,
        side: BorderSide(color: borderColor ?? Colors.grey),
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(isRounded ? 1000 : radius ?? 10)),
        disabledBackgroundColor: Colors.black45,
      );
    }
    return ElevatedButton.styleFrom(
      elevation: elevation,
      backgroundColor: Colors.transparent,
      foregroundColor: borderColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isRounded ? 1000 : radius ?? 10)),
      disabledBackgroundColor: Colors.transparent,
    );
  }

  Widget _parentWidget(Widget child, ButtonStyle? style) {
    if (isOutlined) {
      return OutlinedButton(
          onPressed: disabled || loading ? null : onPressed,
          style: style,
          child: child);
    }
    return ElevatedButton(
        onPressed: disabled || loading ? null : onPressed,
        style: style,
        child: child);
  }
}
