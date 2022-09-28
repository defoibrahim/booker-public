import 'package:bsa/app/modules/settings/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_booking_public/app/modules/settings/views/settings_view.dart';

import '../../home/views/home_view.dart';

class MainScreenController extends GetxController {
  final _currentPage = 1.obs;
  int get currentPage => _currentPage.value;
  set currentPage(int index) => _currentPage(index);
  final List<Widget> taps = [
    OrdersView(),
    HomeView(),
    SettingsView(),
  ];

  @override
  void onInit() {
    super.onInit();
    Get.find<SettingsController>().loadBalance();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
