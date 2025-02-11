import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/text_styles.dart';
import 'package:flutter/material.dart';

class GlobalThemData {
  static ThemeData lightThemeData = themeData(
      AppColors.lightColorScheme,
      AppColors.lightFocusColor,
      colorWhite,
      AppTypography.lightTextTheme
  );
  static ThemeData darkThemeData = themeData(
      AppColors.darkColorScheme,
      AppColors.darkFocusColor,
      AppColors.darkFocusColor,
      AppTypography.darkTextTheme);

  static ThemeData themeData(
      ColorScheme colorScheme,
      Color focusColor,
      Color cardColor,
      TextTheme textTheme) {

    return ThemeData(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,//Used as secondary color almost everywhere
      cardColor: cardColor, //Used where cards are displayed e.g. Events List Items
      textTheme: textTheme,
    );
  }
}