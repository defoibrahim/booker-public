import 'dart:developer';

import 'package:dio/dio.dart' as dio;
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:s_booking_public/app/core/commons/common_variables.dart';
import 'package:s_booking_public/app/core/exception/api_failure.dart';


dio.Response<dynamic> responseHandler(
  dio.Response<dynamic> response,
) {
  // log(response.toString());
  switch (response.statusCode) {
    case 200:
    case 201:
    case 202:
      final Map<String, dynamic> jsonResponse =
          response.data as Map<String, dynamic>;

      if (response.requestOptions.path.contains('login.php')) {
        if (jsonResponse.containsKey('success') &&
            jsonResponse['success'] == true) {
          final token = jsonResponse[
              'token']; //it depends on how your server sending cookie

          log(token);
          CommonVariables.settings.write(TOKEN, token);
          return response;
        }
      }

      if (jsonResponse.containsKey('success')) {
        if (jsonResponse['success'] == false) {
          throw Failure(
            message: jsonResponse['message'] as String,
            details: jsonResponse['errors'],
            errorCode: jsonResponse['error_code'],
          );
        }
      }
      if (jsonResponse.containsKey('error')) {
        throw Failure(
          message: jsonResponse['error']['message'] as String,
          errorCode: jsonResponse['error_code'],
        );
      }
      // var responseJson = response.body;
      return response;

    case 500:
      throw Failure(message: "Server Error please retry later".tr);
    case 403:
      throw Failure(
        message: 'Error occurred please check internet and retry.'.tr,
      );
    case 404:
      throw Failure(message: 'Page not found'.tr);
    case 401:
      throw Failure(message: 'Autherization problem, Please login agian'.tr);
    default:
      throw Failure(message: 'Error occurred retry'.tr);
  }
}
