import 'package:get/get.dart';

import 'auth_controller.dart';


class AddPostController extends GetxController {
  final _auth = Get.find<AuthController>();

  void logout()  {
    _auth.logout();
  }
}