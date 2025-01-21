import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:capp_mobile/shared/constants/integers.dart';
import 'package:capp_mobile/data/remote/remote.dart';
import 'package:capp_mobile/core/response.dart' as response;
import 'package:capp_mobile/shared/exceptions/http_exception.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, response.Response>>
      handleException<T extends Object>(
          Future<Response<dynamic>> Function() handler,
          {String endpoint = ''}) async {
    try {
      final res = await handler();
      return Right(
        response.Response(
          statusCode: res.statusCode ?? statusCode_200,
          data: res.data,
          statusMessage: res.statusMessage,
        ),
      );
    } catch (e) {
      String message = '';
      String identifier = '';
      int statusCode = statusCode_0;
      log(e.runtimeType.toString());
      switch (e.runtimeType) {
        case SocketException _:
          e as SocketException;
          message = "Unable to connect to the server.";
          statusCode = statusCode_0;
          identifier = 'Socket Exception ${e.message}\n at  $endpoint';
          break;

        case DioException _:
          e as DioException;
          message = e.response?.data?['message'] ?? "Internal Error occurred";
          statusCode = statusCode_1;
          identifier = 'DioError ${e.message} \nat  $endpoint';
          break;

        default:
          message = "Unknown error occurred";
          statusCode = statusCode_2;
          identifier = 'Unknown error ${e.toString()}\n at $endpoint';
      }
      return Left(
        AppException(
          message: message,
          statusCode: statusCode,
          identifier: identifier,
        ),
      );
    }
  }
}
