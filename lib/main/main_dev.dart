


import '../domain/model/enums/app_type.dart';
import '../main.dart';

///Entry point of Dev build
/// The [AppEnvironment.dev] is an enum value that represents the Dev
/// environment of the application.
Future<void> main() async => mainCommon(AppEnvironment.dev);
