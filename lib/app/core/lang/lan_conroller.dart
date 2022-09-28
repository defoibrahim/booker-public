import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class LanguageController extends GetxController {
  void changeLanguage(String p1, String p2) {
    final Locale local = Locale(p1, p2);
    Get.updateLocale(local);
  }
}
