# f11_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

AutoRoute: https://pub.dev/packages/auto_route
 - When ever add a widget, add annotation on widget class "@RoutePage()"
 - run `flutter pub run build_runner build` to generate the route file
 - Add route in [route.dart] file
 - If widget name is LoginScreen then route name will be LoginRoute
 - To navigate to the route use `pushRoute(LoginRoute)'.
