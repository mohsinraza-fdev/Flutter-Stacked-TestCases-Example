import 'package:flutter/material.dart';
import 'package:flutter_stacked_testcases_example/constants/app_fonts.dart';

typedef AppTextStyleFunc = TextStyle Function(BuildContext, Color);

class AppTextStyles {
  static String get _primaryFontFamily => AppFonts.poppoins;

  static TextStyle c12(BuildContext context, Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: color,
      );

  static TextStyle l12(BuildContext context, Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: color,
      );

  static TextStyle t14(BuildContext context, Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: color,
      );

  static TextStyle t16(BuildContext context, Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: color,
      );

  static TextStyle t18(BuildContext context, Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: color,
      );

  static TextStyle h24(BuildContext context, Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 24,
        color: color,
      );

  static TextStyle h32(BuildContext context, Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 32,
        color: color,
      );

  static TextStyle b14(BuildContext context, Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: color,
      );
  static TextStyle b16(BuildContext context, Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: color,
      );
}
