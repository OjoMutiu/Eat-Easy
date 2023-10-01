import 'package:eat_easy/constants/app_colors.dart';
import 'package:eat_easy/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary50),
    useMaterial3: true,
    textTheme: lightTextTheme,
  );

  static TextTheme lightTextTheme = const TextTheme(
    //All Headlines 1-6
    displayLarge: TextStyle(
        fontFamily: 'Inter', fontSize: 40, fontWeight: FontWeight.w700),
    displayMedium: TextStyle(
        fontFamily: 'Inter', fontSize: 32, fontWeight: FontWeight.w700),
    displaySmall: TextStyle(
        fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.w700),
    headlineLarge: TextStyle(
        fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(
        fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700),
    headlineSmall: TextStyle(
        fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w700),

    //All titles 1-2
    titleLarge: TextStyle(
        fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(
        fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.w600),

    //All Subtitles 1-2
    titleSmall: TextStyle(
        fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(
        fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w500),

    //All bodies 1-2
    bodyMedium: TextStyle(
        fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(
        fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w400),
  );
}
