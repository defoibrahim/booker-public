import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:s_booking_public/app/core/connections/dio_client.dart';
import 'package:s_booking_public/app/core/exception/api_failure.dart';

class AuthServices {
  static Future<Either<Map<String, dynamic>, Failure>> getSMS(
      Map<String, dynamic> request) async {
    try {
      final response =
          await DioClient.DIO_CLIENT.post('json/initiate.php', data: request);

      return left(response.data);
    } on dio.DioError catch (e) {
      return right(e.error as Failure);
    } catch (e) {
      return right(Failure(
        message: 'Error while formating data'.tr,
      ));
    }
  }

  static Future<Either<bool, Failure>> resendOTP(
      Map<String, dynamic> request) async {
    try {
      final response =
          await DioClient.DIO_CLIENT.post('json/resend.php', data: request);

      return left(response.statusCode == 200);
    } on dio.DioError catch (e) {
      return right(Failure(message: e.message));
    } catch (e) {
      return right(Failure(
        message: 'Error while formating data'.tr,
      ));
    }
  }

  static Future<Either<Map<String, dynamic>, Failure>> verifyOTP(
      int subscriberId, String otp) async {
    try {
      final Map<String, dynamic> request = <String, dynamic>{
        "subscribe_request_id": subscriberId,
        "otp": otp,
      };
      final response =
          await DioClient.DIO_CLIENT.post('json/validate.php', data: request);

      return left(response.data);
    } on dio.DioError catch (e) {
      return right(Failure(message: e.message));
    } catch (e) {
      return right(Failure(
        message: 'Error while formating data'.tr,
      ));
    }
  }

}
