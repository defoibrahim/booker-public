// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:s_booking_public/app/core/commons/common_variables.dart';
import 'package:s_booking_public/app/core/values/constants.dart';

import 'http_handler.dart';

class DioClient {
  static Dio get DIO_CLIENT {
    final Dio _dio = Dio(
      BaseOptions(
        baseUrl: kServerURL,
        contentType: 'application/json',
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          if (!options.path.contains('login.php')) {
            options.headers['Authorization'] =
                "Bearer " + CommonVariables.settings.read(TOKEN);
          }
          return handler.next(options);
        },
        onResponse:
            (Response<dynamic> e, ResponseInterceptorHandler handler) async {
          try {
            final Response<dynamic> result = responseHandler(e);
            return handler.next(result);
          } catch (e) {
            log('E: $e');
            final DioError error =
                DioError(requestOptions: RequestOptions(path: ''), error: e);
            return handler.reject(error);
          }
        },
        onError: (DioError e, ErrorInterceptorHandler handler) {},
      ),
    );

    return _dio;
  }
}
