import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:insta_clone_flutter/core/model/login_models.dart';

import '../services/auth_api_service.dart';
import '../services/shared_pref_service.dart';
import '../util/helpers.dart';
import 'auth_controller.dart';

class LoginController extends GetxController {
  final _authApi = Get.find<AuthApiService>();
  final _sharedService = Get.find<SharedPrefService>();
  final _authController = Get.find<AuthController>();

  late TextEditingController emailOrMobileNoOrUserNameController;
  late TextEditingController passwordController;

  var isLoading = false.obs;

  @override
  void onInit() {
    emailOrMobileNoOrUserNameController =
        TextEditingController(text: "sandeep");
    passwordController = TextEditingController(text: "1234567");
    super.onInit();
  }

  @override
  void onClose() {
    emailOrMobileNoOrUserNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    if (!validateUser()) return;
    var model = LoginRequestModel(
      userName: emailOrMobileNoOrUserNameController.text,
      password: passwordController.text,
    );
    isLoading.value = true;
    var result = await _authApi.loginUser(model);
    if (result.isSuccess) {
      _sharedService.storeAuthToken(result.token!);
      var token = await _sharedService.getAuthToken();
      print(token);

      _authController.loggedIn.value = true;
    } else {
      showSnackBar1("Failed", result.errorMessage.toString());
    }
    isLoading.value = false;
  }

  bool validateUser() {
    if (emailOrMobileNoOrUserNameController.text.isEmpty) {
      showSnackBar1("Error", "Enter User name");
      return false;
    }
    if (passwordController.text.isEmpty) {
      showSnackBar1("Error", "Enter Password");
      return false;
    }
    return true;
  }
}
