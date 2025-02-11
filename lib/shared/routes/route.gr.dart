// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:capp_mobile/domain/model/ui_dto/event.dart' as _i11;
import 'package:capp_mobile/features/feedback/give_feedback_screen.dart' as _i3;
import 'package:capp_mobile/features/feedback/review_submitted_screen.dart'
    as _i6;
import 'package:capp_mobile/features/home/add_event_screen.dart' as _i1;
import 'package:capp_mobile/features/home/home_screen.dart' as _i4;
import 'package:capp_mobile/features/login/screen/forget_password.dart' as _i2;
import 'package:capp_mobile/features/login/screen/login_screen.dart' as _i5;
import 'package:capp_mobile/features/login/screen/signup_screen.dart' as _i7;
import 'package:capp_mobile/features/splash/screens/splash_screen.dart' as _i8;
import 'package:flutter/material.dart' as _i10;

/// generated route for
/// [_i1.AddEventScreen]
class AddEventRoute extends _i9.PageRouteInfo<AddEventRouteArgs> {
  AddEventRoute({
    _i10.Key? key,
    required _i11.Event? event,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          AddEventRoute.name,
          args: AddEventRouteArgs(
            key: key,
            event: event,
          ),
          initialChildren: children,
        );

  static const String name = 'AddEventRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddEventRouteArgs>();
      return _i1.AddEventScreen(
        key: args.key,
        event: args.event,
      );
    },
  );
}

class AddEventRouteArgs {
  const AddEventRouteArgs({
    this.key,
    required this.event,
  });

  final _i10.Key? key;

  final _i11.Event? event;

  @override
  String toString() {
    return 'AddEventRouteArgs{key: $key, event: $event}';
  }
}

/// generated route for
/// [_i2.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i9.PageRouteInfo<void> {
  const ForgetPasswordRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ForgetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.ForgetPasswordScreen();
    },
  );
}

/// generated route for
/// [_i3.GiveFeedbackScreen]
class GiveFeedbackRoute extends _i9.PageRouteInfo<GiveFeedbackRouteArgs> {
  GiveFeedbackRoute({
    _i10.Key? key,
    required _i11.Event event,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          GiveFeedbackRoute.name,
          args: GiveFeedbackRouteArgs(
            key: key,
            event: event,
          ),
          initialChildren: children,
        );

  static const String name = 'GiveFeedbackRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GiveFeedbackRouteArgs>();
      return _i3.GiveFeedbackScreen(
        key: args.key,
        event: args.event,
      );
    },
  );
}

class GiveFeedbackRouteArgs {
  const GiveFeedbackRouteArgs({
    this.key,
    required this.event,
  });

  final _i10.Key? key;

  final _i11.Event event;

  @override
  String toString() {
    return 'GiveFeedbackRouteArgs{key: $key, event: $event}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i4.HomeScreen(key: args.key);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginScreen();
    },
  );
}

/// generated route for
/// [_i6.ReviewSubmittedScreen]
class ReviewSubmittedRoute extends _i9.PageRouteInfo<ReviewSubmittedRouteArgs> {
  ReviewSubmittedRoute({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ReviewSubmittedRoute.name,
          args: ReviewSubmittedRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ReviewSubmittedRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReviewSubmittedRouteArgs>(
          orElse: () => const ReviewSubmittedRouteArgs());
      return _i6.ReviewSubmittedScreen(key: args.key);
    },
  );
}

class ReviewSubmittedRouteArgs {
  const ReviewSubmittedRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'ReviewSubmittedRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.SignupScreen]
class SignupRoute extends _i9.PageRouteInfo<void> {
  const SignupRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.SignupScreen();
    },
  );
}

/// generated route for
/// [_i8.SplashScreen]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashScreen();
    },
  );
}
