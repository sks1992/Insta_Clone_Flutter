import 'package:get/get.dart';

import '../../app_routes.dart';
import '../services/shared_pref_service.dart';

class AuthController extends GetxController {
  final _sharedService = Get.find<SharedPrefService>();
  var loggedIn = false.obs;

  @override
  void onInit() async {
    ever(loggedIn, fireRoute);
    await userLoggedIn();
    super.onInit();
  }

  Future userLoggedIn() async {
    String savedToken = await _sharedService.getAuthToken();
    loggedIn.value = savedToken.isNotEmpty;
  }

  void fireRoute(bool isLogged) async {
    if (isLogged) {
      Get.offAllNamed(RouteNames.dashBoardScreen);
    } else {
      Get.offAllNamed(RouteNames.loginScreen);
    }
  }

  void logout() {
    _sharedService.clearOnLogout();
    loggedIn.value = false;
  }
}
