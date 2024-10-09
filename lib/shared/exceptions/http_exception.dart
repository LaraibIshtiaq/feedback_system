import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:f11_flutter/core/response.dart';

import '../constants/integers.dart';

/// Custom exception class for handling application-specific exceptions
class AppException implements Exception {
  final String? message;
  final int? statusCode;
  final String? identifier;

  AppException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  });

  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
}

/// Custom exception class for cache failure
class CacheFailureException extends Equatable implements AppException {
  @override
  String? get identifier => "Cache failure exception";

  @override
  String? get message => "Unable to save user";

  @override
  int? get statusCode => statusCode_100;

  @override
  List<Object?> get props => [message, statusCode, identifier];
}

/// Extension to convert an [AppException] into a [Left] with [Response]
extension HttpExceptionExtension on AppException {
  Left<AppException, Response> get toLeft => Left<AppException, Response>(this);
}
