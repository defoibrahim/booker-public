
import 'package:get/get.dart';

import 'package:s_booking_public/app/modules/main_screen/controllers/main_screen_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainScreenController>(
      () => MainScreenController(),
    );
    Get.put(OrdersController());
    Get.put(HomeController());
  }
}
