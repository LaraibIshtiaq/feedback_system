import 'package:auto_route/auto_route.dart';
import 'package:f11_flutter/features/login/screen/signup_screen.dart';
import 'package:f11_flutter/shared/routes/route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material(); //.cupertino, .adaptive ..etc


  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: ForgetPasswordRoute.page),
    AutoRoute(page: SignupRoute.page),
  ];

}