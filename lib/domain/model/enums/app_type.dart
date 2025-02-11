enum AppEnvironment { dev, staging, prod }

extension TopicToString on AppEnvironment{
  String get value{
    switch(this){
      case AppEnvironment.prod:
        return 'production';
      case AppEnvironment.dev:
        return 'development';
      case AppEnvironment.staging:
        return 'staging';
    }
  }
}