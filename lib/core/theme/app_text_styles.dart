import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Inter Styles
  static TextStyle interLight({double fontSize = 14, Color? color, TextDecoration? decoration}) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        color: color,
        decoration: decoration,
      );

  static TextStyle interRegular({double fontSize = 14, Color? color, TextDecoration? decoration}) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
        decoration: decoration,
      );

  static TextStyle interMedium({double fontSize = 14, Color? color, TextDecoration? decoration}) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
        decoration: decoration,
      );

  static TextStyle interBold({double fontSize = 14, Color? color, TextDecoration? decoration}) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
        decoration: decoration,
      );

  // Poppins Styles
  static TextStyle poppinsLight({double fontSize = 14, Color? color, TextDecoration? decoration}) =>
      GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        color: color,
        decoration: decoration,
      );

  static TextStyle poppinsRegular({double fontSize = 14, Color? color, TextDecoration? decoration}) =>
      GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
        decoration: decoration,
      );

  static TextStyle poppinsMedium({double fontSize = 14, Color? color, TextDecoration? decoration}) =>
      GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
        decoration: decoration,
      );

  static TextStyle poppinsBold({double fontSize = 14, Color? color, TextDecoration? decoration}) =>
      GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
        decoration: decoration,
      );
}
