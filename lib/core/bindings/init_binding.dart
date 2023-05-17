import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../services/auth_api_service.dart';
import '../services/shared_pref_service.dart';
import '../services/url_service.dart';


class InitBinding  extends Bindings {
  @override
  void dependencies() {
    Get.put(UrlService());
    Get.put(SharedPrefService());
    Get.put(AuthApiService(),permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}