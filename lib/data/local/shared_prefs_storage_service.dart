import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'storage_service.dart';

/// A service for interacting with shared preferences as a storage mechanism.
class SharedPrefsService implements StorageService {
  SharedPreferences? sharedPreferences;

  final Completer<SharedPreferences> initCompleter = Completer<SharedPreferences>();

  @override
  /// Initializes the shared preferences service.
  ///
  /// Completes the [initCompleter] with an instance of [SharedPreferences].
  void init() {
    initCompleter.complete(SharedPreferences.getInstance());
  }

  @override
  /// Returns a boolean indicating whether the shared preferences service
  /// has been initialized.
  bool get hasInitialized => sharedPreferences != null;
}

