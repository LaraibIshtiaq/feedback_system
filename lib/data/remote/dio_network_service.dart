import 'dart:io';

import 'package:capp_mobile/data/remote/network_service.dart';
import 'package:capp_mobile/main/app_env.dart';
import 'package:capp_mobile/shared/exceptions/http_exception.dart';
import 'package:capp_mobile/shared/mixins/exception_handler_mixin.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core/response.dart' as response;

final kTestMode = Platform.environment.containsKey('FLUTTER_TEST');

  /// A network service implementation using Dio library with exception handling.
class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;

  /// Creates an instance of [DioNetworkService] with the provided [dio] client.
  /// The [dio] client is configured with the base options and interceptors
  /// based on the application mode.
  DioNetworkService(this.dio) {
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  /// Retrieves the base options for the Dio client.
  BaseOptions get dioBaseOptions => BaseOptions(
    baseUrl: baseUrl,
    headers: headers,
  );

  @override
  String get baseUrl => EnvInfo.connectionString;

  @override
  Map<String, Object> get headers => {
    'accept': 'application/json',
    'content-type': 'application/json',
  };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if (!kTestMode) {
      dio.options.headers = header;
    }
    return header;
  }

  @override
  /// Performs a POST request to the specified [endpoint] with optional [data].
  /// Returns a [Future] that completes with either an [AppException] if an
  /// error occurs or a [response.Response] on success.
  Future<Either<AppException, response.Response>> post(String endpoint, {Map<String, dynamic>? data}) {
    final res = handleException(
          () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  /// Performs a GET request to the specified [endpoint] with
  /// optional [queryParameters].
  /// Returns a [Future] that completes with either an [AppException]
  /// if an error occurs or a [response.Response] on success.
  Future<Either<AppException, response.Response>> get(String endpoint, {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
          () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  /// Performs a DELETE request to the specified [endpoint] with optional [data].
  /// Returns a [Future] that completes with either an [AppException] if an error occurs
  /// or a [response.Response] on success.
  Future<Either<AppException, response.Response>> delete(String endpoint, {Map<String, dynamic>? data}) {
    final res = handleException(
          () => dio.delete(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  /// Performs a PUT request to the specified [endpoint] with optional [data].
  /// Returns a [Future] that completes with either an [AppException] if an error occurs
  /// or a [response.Response] on success.
  Future<Either<AppException, response.Response>> put(String endpoint, {Map<String, dynamic>? data}) {
    final res = handleException(
          () => dio.put(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

}

