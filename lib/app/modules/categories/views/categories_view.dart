import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'.tr),
        centerTitle: true,
      ),
      body: Container(
        child: GridView.builder(
          itemCount: controller.categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return CategoryCardWidget(
              category: controller.categories[index],
            );
          },
          shrinkWrap: true,
          primary: false,
        ),
      ).paddingOnly(top: 20),
    );
  }
}
