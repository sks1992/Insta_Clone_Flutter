import 'package:get/get.dart';

import '../util/local_storage.dart';

class SharedPrefService extends GetxService {
  String spAuthTokenKey = "auth_token";

  //to store auth Token
  void storeAuthToken(String authToken) {
    LocalStorage.sharedInstance
        .writeValue(key: spAuthTokenKey, value: authToken);
  }

  //to get the auth token value
  Future<String> getAuthToken() async {
    return await LocalStorage.sharedInstance.readValue(spAuthTokenKey);
  }

  //on logout clear auth token
  void clearOnLogout() {
    LocalStorage.sharedInstance.deleteValue(spAuthTokenKey);
  }
}
