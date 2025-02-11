import 'package:capp_mobile/shared/routes/route.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:capp_mobile/shared/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  final router = AppRouter();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      AppDimensions.initialize(MediaQuery.of(context).size.width);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Build the application UI using the `MaterialApp` widget.
    return Consumer(
      builder: (context, ref, _){
        return MaterialApp.router(
          title: 'CAPP - TEO Customer App',
          debugShowCheckedModeBanner: false,

          localizationsDelegates: context.localizationDelegates,
          /// Setting the supported locales
          supportedLocales: context.supportedLocales,

          themeMode: ThemeMode.system,
          theme: GlobalThemData.lightThemeData,
          darkTheme: GlobalThemData.darkThemeData,

          routerConfig: router.config(),
        );
      }
    );
  }
}