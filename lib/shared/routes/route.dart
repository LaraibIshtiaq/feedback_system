import 'package:auto_route/auto_route.dart';
import 'package:capp_mobile/shared/routes/route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material(); //.cupertino, .adaptive ..etc


  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: AddEventRoute.page),
    AutoRoute(page: GiveFeedbackRoute.page),
    AutoRoute(page: ReviewSubmittedRoute.page),
    AutoRoute(page: ContactUsRoute.page),
    AutoRoute(page: NotificationsRoute.page)
  ];

}