import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  AppTheme._();

  static String fontFamily = 'URW DIN Arabic';

  static ThemeData theme = ThemeData(
    fontFamily: fontFamily,
    primaryColor: ColorsManager.primary,
    scaffoldBackgroundColor: ColorsManager.background,
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: ColorsManager.primary,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsManager.primary,
      selectionColor: ColorsManager.primary.withOpacity(.45),
      selectionHandleColor: ColorsManager.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        backgroundColor: ColorsManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        splashFactory: NoSplash.splashFactory,
      ),
    ),
    cardTheme: const CardTheme(elevation: 0),
    colorScheme: const ColorScheme.light(
      primary: ColorsManager.primary,
      onPrimary: ColorsManager.background,
    ),
    useMaterial3: true,
  );
}
