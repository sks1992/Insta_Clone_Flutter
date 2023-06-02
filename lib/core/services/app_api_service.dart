import 'dart:convert';

import 'package:insta_clone_flutter/core/model/like_model.dart';
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

  Future<List<Posts>> getAllPost() async {
    var response = await get('/allPosts');

    if (response.hasError) {
      return [];
    } else {
      List<dynamic> _postList = jsonDecode(response.bodyString!);
      final _list = _postList.map((e) => Posts.fromJson(e)).toList();

      return _list;
    }
  }

  Future<LikePostResponseModel> postLike(LikeModel model) async {
    var response = await post('/likes', model.toJson());

    if (response.hasError) {
      return LikePostResponseModel(
        isSuccess: false,
        errorMessage: getHttpStatusMessage(response),
      );
    }
    return LikePostResponseModel.fromJson(json.decode(response.bodyString!));
  }
}
