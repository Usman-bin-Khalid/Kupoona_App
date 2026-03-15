import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Inter Styles
  static TextStyle interLight({double fontSize = 14, Color? color}) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        color: color,
      );

  static TextStyle interRegular({double fontSize = 14, Color? color}) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle interMedium({double fontSize = 14, Color? color}) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle interBold({double fontSize = 14, Color? color}) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
      );

  // Poppins Styles
  static TextStyle poppinsLight({double fontSize = 14, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        color: color,
      );

  static TextStyle poppinsRegular({double fontSize = 14, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle poppinsMedium({double fontSize = 14, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle poppinsBold({double fontSize = 14, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
      );
}
