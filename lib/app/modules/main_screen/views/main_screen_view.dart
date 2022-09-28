
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:s_booking_public/app/modules/main_screen/views/custom_bottom_appbar.dart';

import '../controllers/main_screen_controller.dart';

class MainScreenView extends GetView<MainScreenController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentPage,
          children: controller.taps,
        ),
        bottomNavigationBar: CustomBottomAppBar(
          selectedIndex: controller.currentPage,
          onChanged: (index) {
            controller.currentPage = index;
          },
        ),
      ),
    );
  }
}
