import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textDarkGrey = Color(0xFF333333);
  static const Color textMediumGrey = Color(0xFF666666);
  static const Color textLightGrey = Color(0xFF9C9C9C);

  static const Color textBlack = Color(0xFF00091F);
  static const Color bgBlack = Color(0xFF00091F);
  static const Color bgLightBlack = Color(0xFF33405C);
  static const Color textLightBlack = Color.fromRGBO(0, 9, 31, 0.4);

  static final Color bgLight = Color.fromRGBO(0, 9, 31, 0.06);
  static const Color bg = Color(0xFFF2F5F9);
  static const Color mainColor = Color(0xFF1A5CFF);
  static const Color bgWhite = Color(0xFFFFFFFF);
  static const Color boxColor = Color(0xFF3B74FF);
  static const Color upload = Color.fromRGBO(230, 57, 70, 0.15);
  static const Color download = Color.fromRGBO(0, 213, 137, 0.15);

  static final light = _AppColorTheme(
    text: textWhite,
    bg: bgWhite,
    mainColor: mainColor,
    bottomTextColor: mainColor,
  );

  static final dark = _AppColorTheme(
    text: textWhite,
    bg: bgBlack,
    mainColor: mainColor,
    bottomTextColor: textWhite,
    bottomBg: bgLightBlack,
  );
}

class _AppColorTheme {
  final Color text;
  final Color bg;
  final Color mainColor;
  final Color bottomTextColor;
  final Color? bottomBg;

  _AppColorTheme( {
    required this.text,
    required this.bg,
    required this.mainColor,
    required this.bottomTextColor,
    this.bottomBg,
  });
}

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.bg,
    primaryColor: AppColors.light.mainColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.light.text),
      bodyMedium: TextStyle(color: AppColors.textBlack),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.light.bottomTextColor,
      backgroundColor: AppColors.light.bg,
      unselectedItemColor: AppColors.textLightGrey,
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bgBlack,
    primaryColor: AppColors.dark.mainColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.dark.text),
      bodyMedium: TextStyle(color: AppColors.dark.text),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.dark.mainColor,
      backgroundColor: AppColors.dark.bottomBg,
      unselectedItemColor: AppColors.textLightGrey,
    ),
  );
}

