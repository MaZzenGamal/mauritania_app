// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mauritania/core/theme/theme.dart';

class TextStyles {
  TextStyles._();

  //==================== Size 36 ====================//
  static TextStyle get extraBold_36 => baseStyle(36, FontWeight.w800);

  //==================== Size 24 ====================//
  static TextStyle get extraBold_24 => baseStyle(24, FontWeight.w800);

  //==================== Size 20 ====================//
  static TextStyle get bold_20 => baseStyle(20, FontWeight.w700);
  static TextStyle get medium_20 => baseStyle(20, FontWeight.w500);
  static TextStyle get regular_20 => baseStyle(20, FontWeight.w400);

  //==================== Size 18 ====================//
  static TextStyle get extraBold_18 => baseStyle(18, FontWeight.w800);
  static TextStyle get bold_18 => baseStyle(18, FontWeight.w700);
  static TextStyle get semiBold_18 => baseStyle(18, FontWeight.w600);
  static TextStyle get medium_18 => baseStyle(18, FontWeight.w500);
  static TextStyle get regular_18 => baseStyle(18, FontWeight.w400);

  //==================== Size 16 ====================//
  static TextStyle get extraBold_16 => baseStyle(16, FontWeight.w800);
  static TextStyle get bold_16 => baseStyle(16, FontWeight.w700);
  static TextStyle get semiBold_16 => baseStyle(16, FontWeight.w600);
  static TextStyle get medium_16 => baseStyle(16, FontWeight.w500);
  static TextStyle get regular_16 => baseStyle(16, FontWeight.w400);

  //==================== Size 15 ====================//
  static TextStyle get bold_15 => baseStyle(15, FontWeight.w700);
  static TextStyle get medium_15 => baseStyle(15, FontWeight.w500);
  static TextStyle get regular_15 => baseStyle(15, FontWeight.w400);

  //==================== Size 14 ====================//
  static TextStyle get bold_14 => baseStyle(14, FontWeight.w700);
  static TextStyle get medium_14 => baseStyle(14, FontWeight.w500);
  static TextStyle get regular_14 => baseStyle(14, FontWeight.w400);

  //==================== Size 12 ====================//
  static TextStyle get medium_12 => baseStyle(12, FontWeight.w500);
  static TextStyle get regular_12 => baseStyle(12, FontWeight.w400);

  //==================== Size 11 ====================//
  static TextStyle get regular_11 => baseStyle(11, FontWeight.w400);

  //==================== Base Style ====================//
  static TextStyle baseStyle(double size, FontWeight weight) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      fontFamily: AppTheme.fontFamily,
    );
  }
}
