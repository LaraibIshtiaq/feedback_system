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
      color: colorTextPrimaryLight
    ),
    //Used in Splash
    displayMedium: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      fontFamily: baseFontFamily,
      color: colorWhite
    ),
    // Used in Event list for Event name, -- HEADING(16)
    displaySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: baseFontFamily,
      color: colorTextPrimaryLight
    ),


    // Used in title heading of screens -- HEADING(18)
    headlineLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600, //Semi-bold
        fontFamily: baseFontFamily,
        color: colorTextPrimaryLight
    ),

    // Used in Calendar headings -- HEADING(20)
    headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600, //Semi-bold
        fontFamily: baseFontFamily,
        color: colorTextPrimaryLight
    ),

    // Used in Project Heading on top -- HEADING(22)
    headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600, //Semi-bold
        fontFamily: baseFontFamily,
        color: colorTextPrimaryLight
    ),


    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: baseFontFamily,
      color: colorTextPrimaryLight
    ),
    //Used in dialog title -- BOLD(18)
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: baseFontFamily,
      color: colorTextPrimaryLight
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: baseFontFamily,
      color: colorTextPrimaryLight
    ),

    // Used in Dropdowns  -- MEDIUM(16)
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: baseFontFamily,
      color: colorTextPrimaryLight
    ),
    // Used in texts like Events: December 2 -- MEDIUM(14)
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: baseFontFamily,
      color: colorTextPrimaryLight
    ),
    // Used in  -- MEDIUM(22)
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: baseFontFamily,
      color: colorTextPrimaryLight
    ),


    //Used in bottom sheet of notification  -- REGULAR(18)
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      fontFamily: baseFontFamily,
      color: colorTextSecondaryLight
    ),
    //Used in calendar dates -- REGULAR(16)
    labelMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      fontFamily: baseFontFamily,
      color: colorTextPrimaryLight
    ),
    //Used in Events List for dates -- REGULAR(14)
    labelSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: baseFontFamily,
      color: colorTextSecondaryLight
    ),
  );

  static const TextTheme darkTextTheme = TextTheme(



    displayLarge: TextStyle(
        fontSize: 66,
        fontWeight: FontWeight.bold,
        fontFamily: baseFontFamily,
        color: colorTextPrimaryDark
    ),
    //Used in splash
    displayMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        fontFamily: baseFontFamily,
        color: colorTextPrimaryDark
    ),
    // Used in Event list for Event name, -- HEADING(16)
    displaySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: baseFontFamily,
        color: colorTextPrimaryDark
    ),



    // Used in title heading of screens -- HEADING(18)
    headlineLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600, //Semi-bold
        fontFamily: baseFontFamily,
        color: colorTextPrimaryDark
    ),

    // Used in Calendar headings -- HEADING(20)
    headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600, //Semi-bold
        fontFamily: baseFontFamily,
        color: colorTextPrimaryDark
    ),

    // Used in Project Heading on top -- HEADING(22)
    headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600, //Semi-bold
        fontFamily: baseFontFamily,
        color: colorTextPrimaryDark
    ),




    titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: baseFontFamily,
        color: colorTextPrimaryDark
    ),
    //Used in dialog title -- BOLD(18)
    titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: baseFontFamily,
        color: colorTextPrimaryDark
    ),
    titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: baseFontFamily,
        color: colorTextPrimaryLight
    ),


    // Used in Dropdowns  -- MEDIUM(16)
    bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: baseFontFamily,
        color: colorTextPrimaryDark
    ),
    // Used in texts like Events: December 2 -- MEDIUM(14)
    bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: baseFontFamily,
        color: colorTextPrimaryDark
    ),
    // Used in  -- MEDIUM(22)
    bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: baseFontFamily,
        color: colorTextPrimaryDark
    ),




    //Used in bottom sheet of notification  -- REGULAR(18)
    labelLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        fontFamily: baseFontFamily,
        color: colorTextSecondaryDark
    ),
    //Used in calendar dates -- REGULAR(16)
    labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontFamily: baseFontFamily,
        color: colorTextPrimaryDark
    ),
    //Used in Events List for dates -- REGULAR(14)
    labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontFamily: baseFontFamily,
        color: colorTextSecondaryDark
    ),
  );

}