import 'dart:convert';

import 'package:insta_clone_flutter/core/model/posts_model.dart';

import '../model/result_model.dart';
import '../util/helpers.dart';
import 'base_api_service.dart';

class AppApiService extends BaseApiService {
  Future<ResultModel> createPostReal(CreatePostModel model) async {
    var response = await post("/addPosts", model.toJson());
    if (response.hasError) {
      return ResultModel(
          isSuccess: false, errorMessage: getHttpStatusMessage(response));
    }
    return ResultModel.fromJson(json.decode(response.bodyString!));
  }
}
