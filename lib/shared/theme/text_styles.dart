import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// The [AppTypography] class provides predefined text styles
/// used throughout the app.
/// The [Styles] class provides direct access to text styles.

class AppTypography {
  static const String baseFontFamily = 'Poppins';

  // Theme text styles
  static const TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 66,
      fontWeight: FontWeight.bold,
      fontFamily: baseFontFamily,
      color: colorBlack
    ),
    displayMedium: TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.normal,
      fontFamily: baseFontFamily,
      color: colorBlack
    ),
    displaySmall: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w200,
      fontFamily: baseFontFamily,
      color: colorBlack
    ),
    headlineLarge: TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.bold,
      fontFamily: baseFontFamily,
      color: colorBlack
    ),
    headlineMedium: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.normal,
      fontFamily: baseFontFamily,
      color: colorBlack
    ),
    headlineSmall: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w200,
      fontFamily: baseFontFamily,
      color: colorBlack
    ),
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: baseFontFamily,
      color: colorBlack
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      fontFamily: baseFontFamily,
      color: colorBlack
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w200,
      fontFamily: baseFontFamily,
      color: colorBlack
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: baseFontFamily,
      color: colorBlack
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: baseFontFamily,
      color: colorBlack
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      fontFamily: baseFontFamily,
      color: colorBlack
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: baseFontFamily,
      color: colorBlack
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      fontFamily: baseFontFamily,
      color: colorBlack
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w200,
      fontFamily: baseFontFamily,
      color: colorBlack
    ),
  );

  static const TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 66,
        fontWeight: FontWeight.bold,
        fontFamily: baseFontFamily,
        color: colorBlackSecondVariant
    ),
    displayMedium: TextStyle(
        fontSize: 56,
        fontWeight: FontWeight.normal,
        fontFamily: baseFontFamily,
        color: colorBlackSecondVariant
    ),
    displaySmall: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w200,
        fontFamily: baseFontFamily,
        color: colorBlackSecondVariant
    ),
    headlineLarge: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        fontFamily: baseFontFamily,
        color: colorBlackSecondVariant
    ),
    headlineMedium: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.normal,
        fontFamily: baseFontFamily,
        color: colorBlackSecondVariant
    ),
    headlineSmall: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w200,
        fontFamily: baseFontFamily,
        color: colorBlackSecondVariant
    ),
    titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: baseFontFamily,
        color: colorBlackSecondVariant
    ),
    titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontFamily: baseFontFamily,
        color: colorBlackSecondVariant
    ),
    titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w200,
        fontFamily: baseFontFamily,
        color: colorBlackSecondVariant
    ),
    bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: baseFontFamily,
        color: colorBlackSecondVariant
    ),
    bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontFamily: baseFontFamily,
        color: colorBlackSecondVariant
    ),
    bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w200,
        fontFamily: baseFontFamily,
        color: colorBlackSecondVariant
    ),
    labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: baseFontFamily,
        color: colorBlackSecondVariant
    ),
    labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        fontFamily: baseFontFamily,
        color: colorBlackSecondVariant
    ),
    labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w200,
        fontFamily: baseFontFamily,
        color: colorBlackSecondVariant
    ),
  );

}