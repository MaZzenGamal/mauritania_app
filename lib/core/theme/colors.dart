import 'package:flutter/material.dart';

class ColorsManager {
  ColorsManager._();

  // Base Colors
  static const Color primary = Color(0xFF16a34a); // Green primary color
  static const Color primaryDark = Color(0xFF1D6C31);
  static const Color accent = Color(0xFFDDA853);
  static const Color background = Colors.white;
  static const Color surface = Colors.white;

  // Primary Shades for 0xFF16a34a (Green)
  static const Color primary10 = Color(0xFFE6F4EA); // Very light background
  static const Color primary20 = Color(0xFFC1E3CB); // Light background
  static const Color primary30 = Color(0xFF9CD2AC); // Cards / hover background
  static const Color primary40 = Color(0xFF77C18D); // Border color
  static const Color primary50 = Color(0xFF52B06E); // Default button bg
  static const Color primary60 = Color(0xFF2D9F4F); // Focus ring (close to primary)
  static const Color primary70 = Color(0xFF288E45); // Icon or hover bg
  static const Color primary80 = Color(0xFF227D3B); // Deep primary
  static const Color primary90 = Color(0xFF1D6C31); // Active state
  static const Color primary100 = Color(0xFF185B27); // Deepest tone

  // Transparent Variants for 0xFF16a34a
  static Color primaryOpacity10 = const Color(0xFF16a34a).withOpacity(0.1);
  static Color primaryOpacity20 = const Color(0xFF16a34a).withOpacity(0.2);
  static Color primaryOpacity50 = const Color(0xFF16a34a).withOpacity(0.5);

  // Accent Shades (Optional)
  static const Color accentLight = Color(0xFFF2D8AB);
  static const Color accentDark = Color(0xFFB07C2D);

  // Greyscale (optional helpers)
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);
}