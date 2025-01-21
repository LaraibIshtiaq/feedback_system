import 'package:flutter/material.dart';

/// This color represents primary color of app that is Blue.
const Color colorBlue = Color(0xFF2D66A9);

/// This color represents a light shade of white.
const Color colorBlueFirstVariant = Color(0xFFEFF3F9);

/// This color representing first gradient color for primary button
const Color colorBlueGradientFirst = Color(0xFF428BE1);

/// This color representing second gradient color for primary button
const Color colorBlueGradientSecond = Color(0xFF265A98);

/// This color represents a black color.
const Color colorBlack = Colors.black;

/// Text primary color
const Color colorBlackFirstVariant = Color(0xFF1B2128);

/// Text secondary color
const Color colorBlackSecondVariant = Color(0xFF737373);

/// This color represents a light shade of gray.
const Color colorGrey = Color(0xFF272626);

/// This color represents a granite gray shade.
const Color colorGreyFirstVariant = Color(0xFF484C52);

/// This color represents a super light shade of gray.
const Color colorGreyThirdVariant = Color(0xFF8E9AAB);

/// This color represents a lighter shade of powder blue
const Color colorBackground = Color(0xFFFBFCFE);

/// This color represents a white color.
const Color colorWhite = Colors.white;

/// This color represents a white color.
const Color colorWhiteFirstVariant = Colors.white;

/// This color represents a white color.
const Color colorWhiteSecondVariant = Colors.white;

/// This color represents a red color for error indication.
const Color colorRed = Colors.red;

/// This color represents a primary color of text
const Color colorTextPrimary = colorBlackFirstVariant;

/// This color represents a secondary color of text
const Color colorTextSecondary = colorBlackSecondVariant;

Color lightFocusColor = Colors.black.withOpacity(0.12);
Color darkFocusColor = Colors.white.withOpacity(0.12);

class AppColors {
  static final Color lightFocusColor = colorBlueFirstVariant;
  static final Color darkFocusColor = Colors.white.withOpacity(0.12);

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: colorBlue,
    onPrimary: colorBlack,
    secondary: colorWhite,
    onSecondary: colorRed,
    error: colorRed,
    onError: colorWhite,
    surface: colorBackground,
    onSurface: colorGreyFirstVariant,
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: colorBlue,
    onPrimary: colorWhite,
    secondary: colorGrey,
    onSecondary: colorGreyFirstVariant,
    surface: colorGreyThirdVariant,
    onSurface: colorBlackFirstVariant,
    error: colorRed,
    onError: colorBlack,
    brightness: Brightness.dark,
  );
}