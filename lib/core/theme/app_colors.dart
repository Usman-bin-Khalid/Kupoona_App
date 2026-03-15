import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primary = Color(
    0xFF060ACD,
  ); // Exact blue from the user request
  static const Color primaryInactive = Color(
    0x99060ACD,
  ); // ~60% opacity of the primary
  static const Color primaryLight = Color(0xFFE6E8FF);

  // Neutral colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Color(0xFF98A2B3);
  static const Color lightGrey = Color(0xFFF2F4F7);
  static const Color border = Color(0xFFD0D5DD);

  // Indicators
  static const Color success = Color(
    0xFF12B76A,
  ); // Green for strength indicators
  static const Color error = Color(0xFFF04438);

  // Theme specific colors - Light
  static const Color backgroundLight = Colors.white;
  static const Color textPrimaryLight = Color(0xFF101828);
  static const Color textSecondaryLight = Color(0xFF475467);

  // Theme specific colors - Dark
  static const Color backgroundDark = Color(0xFF101828);
  static const Color textPrimaryDark = Colors.white;
  static const Color textSecondaryDark = Color(0xFF98A2B3);
  static const Color surfaceDark = Color(0xFF1D2939);
}
