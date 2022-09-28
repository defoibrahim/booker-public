
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:s_booking_public/app/core/commons/common_widgets.dart';
import 'package:s_booking_public/app/core/commons/widgets/app_button.dart';
import 'package:s_booking_public/app/core/theme/app_colors.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              'Login'.tr,
            ),
            centerTitle: true,
            elevation: 2,
          ),
          body: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 40),
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 150,
                  ),
                ),
                const SizedBox(height: 80),
                Form(
                  key: controller.formKey,
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: CommonWidgets.appTextField(
                      controller: controller.phoneController,
                      isPhone: true,
                      hintText: 'Phone Number'.tr,
                      textInputAction: TextInputAction.go,
                      onFieldSubmitted: (String value) {
                        controller.login();
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  child: AppButton(
                    text: 'Login'.tr,
                    textColor: Colors.white,
                    onPressed: controller.login,
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(
                  height: 10,
                  thickness: 1,
                  endIndent: 40,
                  indent: 40,
                ),
                const SizedBox(height: 24),
                CommonWidgets.appText('Follow us'.tr),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Transform.scale(
                      scale: 1.1,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/svg/twitter.svg",
                          color: Get.isDarkMode
                              ? kWhiteColor
                              : kMainColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Transform.scale(
                      scale: 1.1,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/svg/facebook.svg",
                          color: Get.isDarkMode
                              ? kWhiteColor
                              : kMainColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Transform.scale(
                      scale: 1.1,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/svg/call.svg",
                          color: Get.isDarkMode
                              ? kWhiteColor
                              : kMainColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
