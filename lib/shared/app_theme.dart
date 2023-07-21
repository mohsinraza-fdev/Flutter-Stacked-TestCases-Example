import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stacked_testcases_example/shared/app_colors.dart';

class AppTheme {
  static AppColors colors(BuildContext context) =>
      Theme.of(context).extension<AppColors>() ?? lightThemeColors;

  static AppColors get lightThemeColors => const AppColors(
        primary: Color(0xFF00BA52),
        primaryHover: Color(0xFF009E46),
        primaryActive: Color(0xFF00853A),
        highLightPrimary: Color(0xFFF5FFFA),
        highLightPrimaryDark: Color(0xFFEBFFF5),
        backgroundLight: Color(0xFFFFFFFF),
        backgroundDark: Color(0xFF000000),
        border: Color(0xFFD5D7DD),
        heading: Color(0xFF25272D),
        body: Color(0xFF46534C),
        placeholder: Color(0xFF9094A2),
        highLightNeutral: Color(0xFFF7F7F8),
        highLightNeutralDark: Color(0xFFE4E4E7),
        disabledBackground: Color(0xFFF4F6F5),
        disabledContent: Color(0xFFACAFB9),
        link: Color(0xFF3A86FF),
        danger: Color(0xFFCF3917),
        dangerHover: Color(0xFFB83314),
        dangerActive: Color(0xFFA12C12),
        success: Color(0xFF52B788),
        selectionGreen: Color(0xFF9ADFA7),
        selectionGreenText: Color(0xFF00471F),
        workplaceType: Color(0xFFFADCDB),
        jobType: Color(0xFFE3F3E4),
        experienceLevel: Color(0xFFF0DEF2),
        compensation: Color(0xFFFFEFD6),
      );

  static ThemeData get light =>
      ThemeData.light().copyWith(extensions: <ThemeExtension<dynamic>>[
        lightThemeColors,
      ]);

  // TODO: - Dark Theme Controls

  static void brightenStatusBar() => SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      );
  static void darkenStatusBar() => SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      );
  static void setStatusBarColor(Color color) =>
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: color,
        ),
      );
}
