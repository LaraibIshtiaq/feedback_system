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
  runApp(ProviderScope(
    observers: [
      Observers(),
    ],
    child: MyApp(),
  ));
}
