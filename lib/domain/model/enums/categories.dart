import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum Categories { pk, dk, releases, leaves, others }

extension CategoriesToString on Categories{
  String get stringValue {
    switch(this){
      case Categories.pk:
        return 'PK Holiday';
      case Categories.dk:
        return 'DK Holiday';
      case Categories.releases:
        return 'Release';
      case Categories.leaves:
        return 'Leave';
      case Categories.others:
        return 'Other';
    }
  }
}

extension CategoriesToInt on Categories{
  /// Represents the integer value of categories,
  /// used further to attach colors etc
  int get intValue {
    switch (this) {
      case Categories.pk:
        return 1;
      case Categories.dk:
        return 2;
      case Categories.releases:
        return 3;
      case Categories.leaves:
        return 4;
      case Categories.others:
        return 5;
    }
  }
}

extension CategoriesColor on Categories{
  /// Represents the colors used for each event type throughout the app
    Color get colorValue {
      switch (this) {
        case Categories.pk:
          return colorPKHolidays;
        case Categories.dk:
          return colorDKHolidays;
        case Categories.releases:
          return colorReleases;
        case Categories.leaves:
          return colorLeaves;
        case Categories.others:
          return colorOthers;
      }
    }

    /// Represents the colors used for each event type throughout the app
    Color get backgroundColorValue {
      switch (this) {
        case Categories.pk:
          return colorPKHolidaysBackground;
        case Categories.dk:
          return colorDKHolidaysBackground;
        case Categories.releases:
          return colorReleasesBackground;
        case Categories.leaves:
          return colorLeavesBackground;
        case Categories.others:
          return colorOthersBackground;
      }
    }
}