// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:capp_mobile/data/remote/models/event.dart' as _i10;
import 'package:capp_mobile/features/feedback/give_feedback_screen.dart' as _i3;
import 'package:capp_mobile/features/feedback/review_submitted_screen.dart'
    as _i6;
import 'package:capp_mobile/features/home/add_event_screen.dart' as _i1;
import 'package:capp_mobile/features/home/home_screen.dart' as _i4;
import 'package:capp_mobile/features/notifications/contact_us/contact_us_screen.dart'
    as _i2;
import 'package:capp_mobile/features/notifications/notifications/notifications_screen.dart'
    as _i5;
import 'package:capp_mobile/features/splash/screens/splash_screen.dart' as _i7;
import 'package:flutter/material.dart' as _i9;

/// generated route for
/// [_i1.AddEventScreen]
class AddEventRoute extends _i8.PageRouteInfo<AddEventRouteArgs> {
  AddEventRoute({
    _i9.Key? key,
    required _i10.Event? event,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          AddEventRoute.name,
          args: AddEventRouteArgs(
            key: key,
            event: event,
          ),
          initialChildren: children,
        );

  static const String name = 'AddEventRoute';

  static _i8.PageInfo page = _i8.PageInfo(
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

  final _i9.Key? key;

  final _i10.Event? event;

  @override
  String toString() {
    return 'AddEventRouteArgs{key: $key, event: $event}';
  }
}

/// generated route for
/// [_i2.ContactUsScreen]
class ContactUsRoute extends _i8.PageRouteInfo<ContactUsRouteArgs> {
  ContactUsRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ContactUsRoute.name,
          args: ContactUsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ContactUsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ContactUsRouteArgs>(
          orElse: () => const ContactUsRouteArgs());
      return _i2.ContactUsScreen(key: args.key);
    },
  );
}

class ContactUsRouteArgs {
  const ContactUsRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'ContactUsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.GiveFeedbackScreen]
class GiveFeedbackRoute extends _i8.PageRouteInfo<GiveFeedbackRouteArgs> {
  GiveFeedbackRoute({
    _i9.Key? key,
    required _i10.Event event,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          GiveFeedbackRoute.name,
          args: GiveFeedbackRouteArgs(
            key: key,
            event: event,
          ),
          initialChildren: children,
        );

  static const String name = 'GiveFeedbackRoute';

  static _i8.PageInfo page = _i8.PageInfo(
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

  final _i9.Key? key;

  final _i10.Event event;

  @override
  String toString() {
    return 'GiveFeedbackRouteArgs{key: $key, event: $event}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
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

  final _i9.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.NotificationsScreen]
class NotificationsRoute extends _i8.PageRouteInfo<NotificationsRouteArgs> {
  NotificationsRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          NotificationsRoute.name,
          args: NotificationsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationsRouteArgs>(
          orElse: () => const NotificationsRouteArgs());
      return _i5.NotificationsScreen(key: args.key);
    },
  );
}

class NotificationsRouteArgs {
  const NotificationsRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'NotificationsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.ReviewSubmittedScreen]
class ReviewSubmittedRoute extends _i8.PageRouteInfo<ReviewSubmittedRouteArgs> {
  ReviewSubmittedRoute({
    _i9.Key? key,
    required String screenTitle,
    required String mainTitle,
    required String subTitle,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ReviewSubmittedRoute.name,
          args: ReviewSubmittedRouteArgs(
            key: key,
            screenTitle: screenTitle,
            mainTitle: mainTitle,
            subTitle: subTitle,
          ),
          initialChildren: children,
        );

  static const String name = 'ReviewSubmittedRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReviewSubmittedRouteArgs>();
      return _i6.ReviewSubmittedScreen(
        key: args.key,
        screenTitle: args.screenTitle,
        mainTitle: args.mainTitle,
        subTitle: args.subTitle,
      );
    },
  );
}

class ReviewSubmittedRouteArgs {
  const ReviewSubmittedRouteArgs({
    this.key,
    required this.screenTitle,
    required this.mainTitle,
    required this.subTitle,
  });

  final _i9.Key? key;

  final String screenTitle;

  final String mainTitle;

  final String subTitle;

  @override
  String toString() {
    return 'ReviewSubmittedRouteArgs{key: $key, screenTitle: $screenTitle, mainTitle: $mainTitle, subTitle: $subTitle}';
  }
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.SplashScreen();
    },
  );
}
