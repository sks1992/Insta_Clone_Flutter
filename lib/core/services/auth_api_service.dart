import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:insta_clone_flutter/core/model/login_models.dart';
import 'package:insta_clone_flutter/core/model/register_model.dart';
import 'package:insta_clone_flutter/core/services/url_service.dart';

import '../model/result_model.dart';
import '../util/helpers.dart';

class AuthApiService extends GetConnect {
  final _urlService = Get.find<UrlService>();

  @override
  void onInit() async {
    httpClient.baseUrl = _urlService.getApiBaseUrl();
    httpClient.timeout = const Duration(minutes: 1);

    httpClient.addRequestModifier<void>((request) {
      if (kDebugMode) {
        print(request.url);
        print(request.toString());
      }
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      if (kDebugMode) {
        print(response.bodyString);
      }
      return response;
    });

    httpClient.addAuthenticator<void>((request) async {
      request.headers['Content-type'] = "application/json";
      return request;
    });

    super.onInit();
  }

  Future<ResultModel> registerUser(RegisterModel model) async {
    var response = await post("/registerUser", model.toJson());
    if (response.hasError) {
      return ResultModel(
          isSuccess: false, errorMessage: getHttpStatusMessage(response));
    }
    return ResultModel.fromJson(json.decode(response.bodyString!));
  }

  Future<LoginResponseModel> loginUser(LoginRequestModel model) async {
    var response = await post("/login", model.toJson());
    if (response.hasError) {
      return LoginResponseModel(
          isSuccess: false, errorMessage: getHttpStatusMessage(response));
    }
    return LoginResponseModel.fromJson(json.decode(response.bodyString!));
  }
}
