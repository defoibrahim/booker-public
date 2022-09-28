import 'package:get/get.dart';
import 'package:s_booking_public/app/controllers/auth_controller.dart';
import 'package:s_booking_public/app/services/settings_services.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<void>(() async => await SettingsServices.initConnection());
    Get.put<SplashController>(SplashController());
    Get.put(AuthController(), permanent: true);
  }
}