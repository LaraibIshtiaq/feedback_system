
import '../domain/model/enums/app_type.dart';
import '../main.dart';

///Entry point of Staging build
/// The [AppEnvironment.staging] is an enum value that represents the staging
/// environment of the application.
Future<void> main() async => mainCommon(AppEnvironment.staging);
