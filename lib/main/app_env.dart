


import '../domain/model/enums/app_type.dart';

abstract class EnvInfo {
  /// This line declares a private static variable _environment of type
  /// AppEnvironment and initializes it with the AppEnvironment.DEV value
  /// as the default environment.
  static AppEnvironment _environment = AppEnvironment.dev;

  static void initialize(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }
  ///These are some getter methods which return variable values according
  /// to Environment.
  static String get appName => _environment._appTitle;
  static String get envName => _environment._envName;
  static String get connectionString => _environment._connectionString;
  static AppEnvironment get environment => _environment;
  static bool get isProduction => _environment == AppEnvironment.prod;
}

///This is an extension called _EnvProperties that adds additional properties
/// and methods to the AppEnvironment enum.
extension _EnvProperties on AppEnvironment {
  static const _appTitles = {
    AppEnvironment.dev: 'TinyMobileRobot_Dev',
    AppEnvironment.staging: 'TinyMobileRobot_Staging',
    AppEnvironment.prod: 'TinyMobileRobot',
  };

  static const _connectionStrings = {
    AppEnvironment.dev: '',
    AppEnvironment.staging: '',
    AppEnvironment.prod: '',
  };

  static const _envs = {
    AppEnvironment.dev: 'dev',
    AppEnvironment.staging: 'staging',
    AppEnvironment.prod: 'prod',
  };

  String get _appTitle => _appTitles[this]!;
  String get _envName => _envs[this]!;
  String get _connectionString => _connectionStrings[this]!;
}
