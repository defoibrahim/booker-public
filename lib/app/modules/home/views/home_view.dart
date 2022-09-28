
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:s_booking_public/app/controllers/auth_controller.dart';
import 'package:s_booking_public/app/core/commons/common_widgets.dart';
import 'package:s_booking_public/app/core/commons/widgets/empty_widget.dart';
import 'package:s_booking_public/app/data/models/location_model.dart';

import 'package:s_booking_public/app/modules/home/controllers/home_controller.dart';
import 'package:s_booking_public/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  final AuthController _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
          ),
        ),
        actions: [
          Obx(
            () => Container(
              child: controller.isLoadingLocations
                  ? Container(
                    width: 100,
                    padding: const EdgeInsets.all(13),
                    child: const Center(child: LinearProgressIndicator()))
                  : PopupMenuButton(
                      initialValue: controller.selectedLocation,
                      onSelected: (value) {
                        controller.selectedLocation = value as Location;
                        controller.getAllServices();
                      },
                      itemBuilder: (context) => controller.locations
                          .map((e) => PopupMenuItem(
                                value: e,
                                child: CommonWidgets.appText(e.name!),
                              ))
                          .toList(),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          CommonWidgets.appText(
                            controller.selectedLocation.name!,
                            fontWeight: FontWeight.w400,
                            textColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(Icons.location_on),
                        ],
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image:
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                  ).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () => controller.init(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                if (_authController.isAuthenticated) _buildWalletCardWidget(),
                const SizedBox(height: 16),
                CommonWidgets.appText(
                  'Hello'.trParams({'name': _authController.user!.name!}),
                  fontWeight: FontWeight.w400,
                  size: 15,
                ),
                const SizedBox(height: 8),
                CommonWidgets.appText(
                  'What service do you need?'.tr,
                  fontWeight: FontWeight.bold,
                  size: 22,
                ),
                const SizedBox(height: 16),
                CommonWidgets.appTextField(
                  hintText: 'Search for service'.tr,
                  border: true,
                  prefix: const Icon(Icons.search_outlined),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    CommonWidgets.appText(
                      'Categories'.tr,
                      fontWeight: FontWeight.bold,
                      size: 22,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.CATEGORIES);
                      },
                      child: CommonWidgets.appText(
                        'See All'.tr,
                        fontWeight: FontWeight.normal,
                        size: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (controller.isLoadingCategories)
                  Container(
                    width: double.infinity,
                    height: 120,
                    child: const Center(child: CircularProgressIndicator()),
                  )
                else
                  Container(
                    height: 130,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categories.length < 6
                          ? controller.categories.length
                          : 6,
                      itemBuilder: (BuildContext context, int index) {
                        return CategoryCardWidget(
                          category: controller.categories[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(width: 8),
                    ),
                  ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    CommonWidgets.appText(
                      'Recomended'.tr,
                      fontWeight: FontWeight.bold,
                      size: 22,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.SERVICES);
                      },
                      child: CommonWidgets.appText(
                        'See All'.tr,
                        fontWeight: FontWeight.normal,
                        size: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (controller.isLoadingServices)
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: const Center(child: const CircularProgressIndicator()),
                  )
                else if (controller.services.isNotEmpty)
                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: controller.services.length < 4
                        ? controller.services.length
                        : 4,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 4,
                      childAspectRatio: 12 / 16,
                    ),
                    itemBuilder: (context, index) {
                      return ServiceCardWidget(
                        service: controller.services[index],
                      );
                    },
                  )
                else
                  EmptyWidget(
                    image: 'assets/svg/no_services.svg',
                    title: 'Opps...!'.tr,
                    subtitle: 'No services available on this location'.tr,
                  ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWalletCardWidget() {
    return CreditCardWidget(
      holderName: _authController.user!.name!,
      balance: _settingsController.balance,
      msisdn: _authController.user!.msisdn!,
    );
  }
}
