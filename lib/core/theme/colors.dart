import 'package:flutter/material.dart';

class ColorsManager {
  ColorsManager._();

  // Base Colors
  static const Color primary = Color(0xFF27548A);
  static const Color primaryDark = Color(0xFF183B4E);
  static const Color accent = Color(0xFFDDA853);
  static const Color background = Colors.white;
  static const Color surface = Colors.white;

  // Primary Shades
  static const Color primary10 = Color(0xFFE8EEF5); // Very light background
  static const Color primary20 = Color(0xFFC3D3E7); // Light background
  static const Color primary30 = Color(0xFF9FB8D9); // Cards / hover background
  static const Color primary40 = Color(0xFF7A9AC0); // Border color
  static const Color primary50 = Color(0xFF4E77A2); // Default button bg
  static const Color primary60 = Color(0xFF3B648E); // Focus ring
  static const Color primary70 = Color(0xFF2E5A85); // Icon or hover bg
  static const Color primary80 = Color(0xFF234A71); // Deep primary
  static const Color primary90 = Color(0xFF1F466F); // Active state
  static const Color primary100 = Color(0xFF0B243C); // Deepest tone

  // Transparent Variants
  static Color primaryOpacity10 = const Color(0xFF27548A).withOpacity(0.1);
  static Color primaryOpacity20 = const Color(0xFF27548A).withOpacity(0.2);
  static Color primaryOpacity50 = const Color(0xFF27548A).withOpacity(0.5);

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
