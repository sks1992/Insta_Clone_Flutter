import 'package:get/get.dart';

class UrlService extends GetxService {
  String getUserApiUrl(){
    return "http://10.0.2.2:1211/api/user";
  }
  String getAppApiUrl(){
    return "http://10.0.2.2:1211/api";
  }
}