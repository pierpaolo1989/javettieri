import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: AppFonts.primaryFont,
    textTheme: const TextTheme(
      titleLarge: AppFonts.heading1,
      // bodyMedium: AppFonts.body,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondary,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
      labelStyle: TextStyle(color: AppColors.textPrimary),
    ),
  );
}
