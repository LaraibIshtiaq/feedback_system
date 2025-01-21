import '../domain/model/enums/app_type.dart';
import '../main.dart';

/// Entry point of Prod build
/// AppEnvironment.PROD to the mainCommon function.
/// The [AppEnvironment.prod] is an enum value that represents the production
/// environment of the application.
void main() => mainCommon(AppEnvironment.prod);