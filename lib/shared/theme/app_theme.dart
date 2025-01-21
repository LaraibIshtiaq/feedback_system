import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/text_styles.dart';
import 'package:flutter/material.dart';

class GlobalThemData {
  static ThemeData lightThemeData = themeData(
      AppColors.lightColorScheme,
      AppColors.lightFocusColor,
      AppTypography.lightTextTheme
  );
  static ThemeData darkThemeData = themeData(
      AppColors.darkColorScheme,
      AppColors.darkFocusColor,
      AppTypography.darkTextTheme);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor, TextTheme textTheme) {
    return ThemeData(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      textTheme: textTheme,
    );
  }
}