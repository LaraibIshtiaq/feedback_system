import 'package:flutter/material.dart';

/// This color represents primary color of app that is Blue.
const Color colorBlue = Color(0xFF2D66A9);

/// Used as secondary color in app, as in calendar dates and project nameplate
const Color colorBlueFirstVariant = Color(0xFFEFF3F9); //LightBlue

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

/// Used as secondary color in app, as in calendar dates and project nameplate
const Color colorBlackThirdVariant = Color(0xFF454545);

/// This color represents a light shade of gray.
const Color colorGrey = Color(0xFF272626);

/// This color represents a granite gray shade.
const Color colorGreyFirstVariant = Color(0xFF484C52);

///Used in dark theme's secondaru text
const Color colorGreySecondVariant = Color(0xFFD5D5D5);

/// This color represents a super light shade of gray.
const Color colorGreyThirdVariant = Color(0xFF8E9AAB);

// Color for divider
const Color colorGreyFourthVariant = Color(0xFFE0E0E0);

/// This color represents a lighter shade of powder blue for light theme background
const Color colorBackgroundLight = Color(0xFFFBFCFE);

/// This color represents a lighter shade of black for dark theme background
const Color colorBackgroundDark = Color(0xFF333333);

/// This color represents a white color.
const Color colorWhite = Colors.white;

/// This color represents a white color.
const Color colorWhiteFirstVariant = Color(0xFFE1E1E1);

/// This color represents a white color.
const Color colorWhiteSecondVariant = Colors.white;

/// This color represents a red color for error indication.
const Color colorRed = Colors.red;

/// This color represents a primary color of text
const Color colorTextPrimaryLight = colorBlackFirstVariant;
const Color colorTextPrimaryDark = colorWhiteFirstVariant;

/// This color represents a secondary color of text
const Color colorTextSecondaryLight = colorBlackSecondVariant;
const Color colorTextSecondaryDark = colorGreySecondVariant;

Color lightFocusColor = Colors.black.withOpacity(0.12);
Color darkFocusColor = Colors.white.withOpacity(0.12);

const Color colorReleases = Color(0xFFA67DB5);
const Color colorPKHolidays = Color(0xFFACBEAA);
const Color colorLeaves = Color(0xFF9793C1);
const Color colorDKHolidays = Color(0xFFE4C0BB);
const Color colorOthers = Color(0xFF93ACC1);
const Color colorReleasesBackground = Color(0xFFF3E7F1); //(0xFFFF9000)(0x FF-> Alpha FF -> Red, 90 -> Blue 00 -> Green)
const Color colorPKHolidaysBackground = Color(0x38ACBEAA);
const Color colorLeavesBackground = Color(0x2B9793C1);
const Color colorDKHolidaysBackground = Color(0x3BE4C0BB);
const Color colorOthersBackground = Color(0xFFF0F3F7);



class AppColors {
  static final Color lightFocusColor = colorBlueFirstVariant;
  static final Color darkFocusColor = colorBlackThirdVariant;

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: colorBlue,
    onPrimary: colorBlack,
    secondary: colorWhite,
    onSecondary: colorRed,
    error: colorRed,
    onError: colorWhite,
    surface: colorBackgroundLight,
    onSurface: colorGreyFirstVariant,
    background: colorBackgroundLight,
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: colorBlue,
    onPrimary: colorWhite,
    secondary: colorGrey,
    onSecondary: colorGreyFirstVariant,
    surface: colorGreyThirdVariant,
    onSurface: colorGreySecondVariant,
    error: colorRed,
    onError: colorBlack,
    background: colorBackgroundDark,
    brightness: Brightness.dark,
  );
}