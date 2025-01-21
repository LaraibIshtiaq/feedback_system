import 'package:flutter/material.dart';

/// A helper class for localization in the CAPP app.
class LocalizationService {
  /// The list of supported locales in the CAPP app.
  ///
  /// By default, the supported locales include English ('en').
  static List<Locale> supportedLocales = const [
    Locale("da"),
    Locale("en"),
  ];

  /// The path to the translation assets in the TMR app.
  ///
  /// The translation files are located in the 'assets/translations' directory.
  static String path = 'assets/translations';

  /// The fallback locale to use in case the desired locale is not available.
  ///
  /// The fallback locale is set to English ('en') with the United States ('US') as the country code.
  static Locale fallbackLocale = const Locale("en", "US");
}
