// ignore_for_file: constant_identifier_names

import 'package:get_storage/get_storage.dart';

const String LANG_CODE = "lang_code";
const String TOKEN = "token";
const String USER_DATA = "user_data";
const String IS_AUTHENTICATED = "is_authenticated";
const String FONT_FAMILY = "font_family";

class CommonVariables {
  static GetStorage userData = GetStorage();
  static GetStorage notification = GetStorage();
  static GetStorage settings = GetStorage();
}
