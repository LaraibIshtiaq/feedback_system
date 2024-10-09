import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Observers extends ProviderObserver {
  ///The didUpdateProvider method is called whenever a provider is updated with a new value.
  /// It takes four parameters:
  /// provider: The provider that was updated.
  /// previousValue: The previous value of the provider.
  /// newValue: The new value that the provider has been updated to.
  /// container: The ProviderContainer object that holds all the providers.
  /// The log message is a JSON string that includes the name or runtime type of the provider, and the new value of the provider.

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }

  ///The didDisposeProvider method is called when a provider is disposed of, meaning it is no longer being used. It takes two parameters:
  /// provider: The provider that was disposed of.
  /// container: The ProviderContainer object that holds all the providers.
  /// Similarly to didUpdateProvider, a log message is created using the log function.
  /// The log message indicates that the provider has been disposed of.

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    log('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "disposed"
}''');
    super.didDisposeProvider(provider, container);
  }
}
