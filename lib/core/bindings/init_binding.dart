import 'package:get/get.dart';

import '../services/auth_api_service.dart';
import '../services/url_service.dart';


class InitBinding  extends Bindings {
  @override
  void dependencies() {
    Get.put(UrlService());
    Get.put(AuthApiService(),permanent: true);
  }
}