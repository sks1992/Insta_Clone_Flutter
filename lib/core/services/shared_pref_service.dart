import 'dart:convert';

import 'package:get/get.dart';

import '../model/login_models.dart';
import '../util/local_storage.dart';

class SharedPrefService extends GetxService {
  String spAuthTokenKey = "auth_token";
  String userKey = "user_data";

  void storeUser(LoginResponseModel user) {
    LocalStorage.sharedInstance.writeValue(
      key: userKey,
      value: json.encode(user.toJson()),
    );
  }

  Future<LoginResponseModel> getUserInfo() async {
    final _user = await LocalStorage.sharedInstance.readValue(userKey);
    if (_user.isEmpty) {
      return LoginResponseModel(
          isSuccess: false, errorMessage: 'No Data Found');
    }
    return LoginResponseModel.fromJson(json.decode(_user));
  }

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
    LocalStorage.sharedInstance.deleteValue(userKey);
  }
}
