import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:s_booking_public/app/core/connections/dio_client.dart';
import 'package:s_booking_public/app/core/exception/api_failure.dart';
import 'package:s_booking_public/app/data/models/category.dart';
import 'package:s_booking_public/app/data/models/location_model.dart';
import 'package:s_booking_public/app/data/models/service_model.dart';



class HomeServices {
  static Future<Either<List<Location>, Failure>> getAllLocations() async {
    try {
      final response = await DioClient.DIO_CLIENT.get('app/locations/view.php');
      final List<Location> locations = (response.data['list'] as List)
          .map((item) => Location.fromJson(item))
          .toList();

      return left(locations);
    } on dio.DioError catch (e) {
      return right(Failure(message: e.message));
    } catch (e) {
      return right(Failure(
        message: 'Error while formating data'.tr,
      ));
    }
  }

  static Future<Either<List<Service>, Failure>> getAllServices(
      Map<String, dynamic> request) async {
    try {
      final response = await DioClient.DIO_CLIENT
          .post('app/services/view.php', data: request);

      final List<Service> services = (response.data['list'] as List)
          .map((item) => Service.fromJson(item))
          .toList();

      return left(services);
    } on dio.DioError catch (e) {
      return right(Failure(message: e.message));
    } catch (e) {
      return right(Failure(
        message: 'Error while formating data'.tr,
      ));
    }
  }

  static Future<Either<List<Category>, Failure>> getAllCategories() async {
    try {
      final response = await DioClient.DIO_CLIENT.get('app/category/index.php');

      final List<Category> categories = (response.data['list'] as List)
          .map((item) => Category.fromJson(item))
          .toList();

      return left(categories);
    } on dio.DioError catch (e) {
      return right(Failure(message: e.message));
    } catch (e) {
      return right(Failure(
        message: 'Error while formating data'.tr,
      ));
    }
  }
}
