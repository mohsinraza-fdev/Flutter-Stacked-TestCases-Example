import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  static Color get white => const Color(0xFFFFFFFF);
  static Color get green0 => const Color(0xFFF1F5F1);

  final Color primary;
  final Color primaryHover;
  final Color primaryActive;
  final Color highLightPrimary;
  final Color highLightPrimaryDark;
  final Color backgroundLight;
  final Color backgroundDark;
  final Color border;
  final Color heading;
  final Color body;
  final Color placeholder;
  final Color highLightNeutral;
  final Color highLightNeutralDark;
  final Color disabledBackground;
  final Color disabledContent;
  final Color link;
  final Color danger;
  final Color dangerHover;
  final Color dangerActive;
  final Color success;
  final Color selectionGreen;
  final Color selectionGreenText;
  final Color workplaceType;
  final Color jobType;
  final Color experienceLevel;
  final Color compensation;

  const AppColors({
    required this.primary,
    required this.primaryHover,
    required this.primaryActive,
    required this.highLightPrimary,
    required this.highLightPrimaryDark,
    required this.backgroundLight,
    required this.backgroundDark,
    required this.border,
    required this.heading,
    required this.body,
    required this.placeholder,
    required this.highLightNeutral,
    required this.highLightNeutralDark,
    required this.disabledBackground,
    required this.disabledContent,
    required this.link,
    required this.danger,
    required this.dangerHover,
    required this.dangerActive,
    required this.success,
    required this.selectionGreen,
    required this.selectionGreenText,
    required this.workplaceType,
    required this.jobType,
    required this.experienceLevel,
    required this.compensation,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
    Color? primaryHover,
    Color? primaryActive,
    Color? highLightPrimary,
    Color? highLightPrimaryDark,
    Color? backgroundLight,
    Color? backgroundDark,
    Color? border,
    Color? heading,
    Color? body,
    Color? placeholder,
    Color? highLightNeutral,
    Color? highLightNeutralDark,
    Color? disabledBackground,
    Color? disabledContent,
    Color? link,
    Color? danger,
    Color? dangerHover,
    Color? dangerActive,
    Color? success,
    Color? selectionGreen,
    Color? selectionGreenText,
    Color? workplaceType,
    Color? jobType,
    Color? experienceLevel,
    Color? compensation,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      primaryHover: primaryHover ?? this.primaryHover,
      primaryActive: primaryActive ?? this.primaryActive,
      highLightPrimary: highLightPrimary ?? this.highLightPrimary,
      highLightPrimaryDark: highLightPrimaryDark ?? this.highLightPrimaryDark,
      backgroundLight: backgroundLight ?? this.backgroundLight,
      backgroundDark: backgroundDark ?? this.backgroundDark,
      border: border ?? this.border,
      heading: heading ?? this.heading,
      body: body ?? this.body,
      placeholder: placeholder ?? this.placeholder,
      highLightNeutral: highLightNeutral ?? this.highLightNeutral,
      highLightNeutralDark: highLightNeutralDark ?? this.highLightNeutralDark,
      disabledBackground: disabledBackground ?? this.disabledBackground,
      disabledContent: disabledContent ?? this.disabledContent,
      link: link ?? this.link,
      danger: danger ?? this.danger,
      dangerHover: dangerHover ?? this.dangerHover,
      dangerActive: dangerActive ?? this.dangerActive,
      success: success ?? this.success,
      selectionGreen: selectionGreen ?? this.selectionGreen,
      selectionGreenText: selectionGreenText ?? this.selectionGreenText,
      workplaceType: workplaceType ?? this.workplaceType,
      jobType: jobType ?? this.jobType,
      experienceLevel: experienceLevel ?? this.experienceLevel,
      compensation: compensation ?? this.compensation,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      primaryHover: Color.lerp(primaryHover, other.primaryHover, t) ?? primaryHover,
      primaryActive: Color.lerp(primaryActive, other.primaryActive, t) ?? primaryActive,
      highLightPrimary: Color.lerp(highLightPrimary, other.highLightPrimary, t) ?? highLightPrimary,
      highLightPrimaryDark: Color.lerp(highLightPrimaryDark, other.highLightPrimaryDark, t) ?? highLightPrimaryDark,
      backgroundLight: Color.lerp(backgroundLight, other.backgroundLight, t) ?? backgroundLight,
      backgroundDark: Color.lerp(backgroundDark, other.backgroundDark, t) ?? backgroundDark,
      border: Color.lerp(border, other.border, t) ?? border,
      heading: Color.lerp(heading, other.heading, t) ?? heading,
      body: Color.lerp(body, other.body, t) ?? body,
      placeholder: Color.lerp(placeholder, other.placeholder, t) ?? placeholder,
      highLightNeutral: Color.lerp(highLightNeutral, other.highLightNeutral, t) ?? highLightNeutral,
      highLightNeutralDark: Color.lerp(highLightNeutralDark, other.highLightNeutralDark, t) ?? highLightNeutralDark,
      disabledBackground: Color.lerp(disabledBackground, other.disabledBackground, t) ?? disabledBackground,
      disabledContent: Color.lerp(disabledContent, other.disabledContent, t) ?? disabledContent,
      link: Color.lerp(link, other.link, t) ?? link,
      danger: Color.lerp(danger, other.danger, t) ?? danger,
      dangerHover: Color.lerp(dangerHover, other.dangerHover, t) ?? dangerHover,
      dangerActive: Color.lerp(dangerActive, other.dangerActive, t) ?? dangerActive,
      success: Color.lerp(success, other.success, t) ?? success,
      selectionGreen: Color.lerp(selectionGreen, other.selectionGreen, t) ?? selectionGreen,
      selectionGreenText: Color.lerp(selectionGreenText, other.selectionGreenText, t) ?? selectionGreenText,
      workplaceType: Color.lerp(workplaceType, other.workplaceType, t) ?? workplaceType,
      jobType: Color.lerp(jobType, other.jobType, t) ?? jobType,
      experienceLevel: Color.lerp(experienceLevel, other.experienceLevel, t) ?? experienceLevel,
      compensation: Color.lerp(compensation, other.compensation, t) ?? compensation,
    );
  }
}
