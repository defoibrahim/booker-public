
import 'package:get/get.dart';
import 'package:s_booking_public/app/data/models/category.dart';
import 'package:s_booking_public/app/modules/home/controllers/home_controller.dart';

class CategoriesController extends GetxController {
List<Category> get categories => Get.find<HomeController>().categories;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
