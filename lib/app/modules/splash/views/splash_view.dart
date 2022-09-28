import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(60),
        child: Hero(
          tag: 'logo',
          child: Image.asset(
            'assets/images/splash-light.gif',
          ),
        ),
      ),
    );
  }
}
