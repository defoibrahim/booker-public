
import 'package:get/get.dart';
import 'package:s_booking_public/app/core/commons/common_variables.dart';
import 'package:s_booking_public/app/data/models/user_model.dart';
import 'package:s_booking_public/app/routes/app_pages.dart';

class AuthController extends GetxController {
  final _isAuthenticated = false.obs;
  bool get isAuthenticated => _isAuthenticated.value;
  set isAuthenticated(bool value) => _isAuthenticated(value);

  final _user = Rxn<User>();
  User? get user => _user.value;
  set user(User? user) => _user(user);

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    final isAuthed = CommonVariables.userData.read(IS_AUTHENTICATED) ?? false;
    if (isAuthed) {
      final userData = CommonVariables.userData.read(USER_DATA);
      if (userData != null) {
        _user.value = User.fromMap(userData);
        _isAuthenticated(true);
        Get.offAllNamed(Routes.MAIN_SCREEN);
      } else {
        _user.value = null;
        _isAuthenticated(false);
        CommonVariables.userData.remove(USER_DATA);
        CommonVariables.userData.remove(IS_AUTHENTICATED);
        Get.offAllNamed(Routes.LOGIN);
      }
    } else {
      _user.value = null;
      _isAuthenticated(false);
      CommonVariables.userData.remove(USER_DATA);
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  Future<void> logout() async {
    _user(null);
    _isAuthenticated(false);
    CommonVariables.userData.remove(USER_DATA);
    CommonVariables.userData.remove(IS_AUTHENTICATED);
    Get.offAllNamed(Routes.SPLASH);
    init();
  }


  @override
  void onClose() {}
}
