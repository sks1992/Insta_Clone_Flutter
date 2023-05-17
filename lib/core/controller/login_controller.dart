import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:insta_clone_flutter/core/model/login_models.dart';

import '../../app_routes.dart';
import '../services/auth_api_service.dart';
import '../util/helpers.dart';

class LoginController extends GetxController {
  final _authApi = Get.find<AuthApiService>();
  late TextEditingController emailOrMobileNoOrUserNameController;
  late TextEditingController passwordController;

  var showSaveProgress = false.obs;

  @override
  void onInit() {
    emailOrMobileNoOrUserNameController = TextEditingController();
    passwordController = TextEditingController();
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
    showSaveProgress.value = true;
    var result = await _authApi.loginUser(model);
    if (result.isSuccess) {
     // Get.offNamed(RouteNames.loginScreen);
      showSnackBar1("Success", "Your Login Success",
          type: SnackBarType.success);
    } else {
      showSnackBar1("Failed", result.errorMessage.toString());
    }
    showSaveProgress.value = false;
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
