import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:capp_mobile/services/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'domain/model/enums/app_type.dart';
import 'main/app.dart';
import 'main/app_env.dart';
import 'main/observers.dart';

/// Entry point of the application.
Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  /// Initialize the environment information for the application.
  EnvInfo.initialize(environment);

  /// Set the system UI overlay style with light status bar and background color.
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );

  /// Run the application with the specified provider scope and observers.
  runApp(
      EasyLocalization(
        supportedLocales: LocalizationService.supportedLocales,
        path: LocalizationService.path,
        fallbackLocale: LocalizationService.fallbackLocale,
        child: ProviderScope(
          observers: [
            Observers(),
          ],
          child: MyApp(),
        ),
      )
  );
}
