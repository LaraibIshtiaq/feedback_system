import 'package:f11_flutter/shared/routes/route.dart';
import 'package:flutter/material.dart';
import '../shared/theme/app_theme.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final router = AppRouter();

  @override
  Widget build(BuildContext context)
  {
    /// Build the application UI using the `MaterialApp` widget.
    return MaterialApp.router(
      /// The title of the application.
      title: 'Flutter TDD',

      /// Whether to show the debug banner in debug mode.
      debugShowCheckedModeBanner: false,

      /// Theme for app
      theme: appTheme,

      /// Router Config
      routerConfig: router.config(),
    );
  }
}
