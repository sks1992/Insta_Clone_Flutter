import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:insta_clone_flutter/core/model/posts_model.dart';
import 'package:insta_clone_flutter/core/services/shared_pref_service.dart';
import 'package:insta_clone_flutter/core/services/url_service.dart';

import '../model/result_model.dart';
import '../util/constants.dart';
import '../util/helpers.dart';

class AppApiService extends GetConnect {
  final _urlService = Get.find<UrlService>();
  final _sharedService = Get.find<SharedPrefService>();

  @override
  void onInit() async {
    httpClient.baseUrl = _urlService.getAppApiUrl();
    httpClient.timeout = const Duration(minutes: 1);

    httpClient.addRequestModifier<void>((request) async {
      var _token = await _sharedService.getAuthToken();
      var _headers = {
        Constants.values.authorizationHeaderName:
            '${Constants.values.tokenType} $_token'
      };
      request.headers.addAll(_headers);
      if (kDebugMode) {
        print(request.url);
        print("Request Body:: ${await request.bodyBytes.bytesToString()}");
      }
      return request;
    });

    httpClient.addResponseModifier((request, response) async {
      if (kDebugMode) {
        log("Response Body::: ${response.bodyString ?? ""}");
      }
      return response;
    });

    httpClient.addAuthenticator<void>((request) async {
      var _token = await _sharedService.getAuthToken();
      request.headers[Constants.values.authorizationHeaderName] =
          '${Constants.values.tokenType} $_token';
      return request;
    });

    super.onInit();
  }


  Future<ResultModel> createPost(CreatePostModel model) async {
    var response = await post("/addPosts", model.toJson());
    if (response.hasError) {
      return ResultModel(
          isSuccess: false, errorMessage: getHttpStatusMessage(response));
    }
    return ResultModel.fromJson(json.decode(response.bodyString!));
  }
}
