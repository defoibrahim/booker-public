import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:s_booking_public/app/core/commons/common_variables.dart';
import 'package:s_booking_public/app/core/connections/dio_client.dart';
import 'package:s_booking_public/app/core/exception/api_failure.dart';

class SettingsServices {
  static Future<Either<bool, Failure>> initConnection() async {
    try {
      final response = await DioClient.DIO_CLIENT.post('json/login.php', data: {
        "username": "app_client",
        "password": "ra@124",
        "remember_me": true
      });
      if (response.statusCode == 200) {
        CommonVariables.settings.write(TOKEN, response.data['token']);
        return left(true);
      } else {
        return right(Failure(message: response.data['message']));
      }
    } on dio.DioError catch (e) {
      return right(Failure(message: e.message));
    } catch (e) {
      return right(Failure(
        message: 'Error while formating data'.tr,
      ));
    }
  }
}
