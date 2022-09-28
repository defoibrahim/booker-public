

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_booking_public/app/controllers/auth_controller.dart';
import 'package:s_booking_public/app/core/commons/common_widgets.dart';
import 'package:s_booking_public/app/core/exception/api_failure.dart';
import 'package:s_booking_public/app/data/models/user_model.dart';
import 'package:s_booking_public/app/routes/app_pages.dart';
import 'package:s_booking_public/app/services/auth_services.dart';

class LoginController extends GetxController {
  final AuthController _authController = Get.find<AuthController>();

  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    if (phoneController.text.isEmpty) {
      CommonWidgets.showSnackBar(
        title: 'Error'.tr,
        message: 'Phone Number'.tr + 'required'.tr,
      );
      return;
    }
    final request = <String, dynamic>{
      "msisdn": "249" + phoneController.text.trim(),
    };
    _isLoading(true);
    final Either<Map<String, dynamic>, Failure> result =
        await AuthServices.getSMS(request);
    _isLoading(false);
    result.fold((response) {
      response['msisdn'] = request['msisdn'];
      if (response.containsKey('subscription_data') &&
          response['subscription_data'] != null) {
        _authController.user = User.fromMap(response['subscription_data']);
      }
      Get.toNamed(Routes.OTP, arguments: response);
    }, (r) {
      switch (r.errorCode) {
        case 102:
          CommonWidgets.showSnackBar(
            title: 'Error'.tr,
            message: 'Invalid phone number'.tr,
          );
          break;
        default:
          CommonWidgets.showSnackBar(
            title: 'Error'.tr,
            message: r.message,
          );
      }
    });
  }

  @override
  void onClose() {}
}
