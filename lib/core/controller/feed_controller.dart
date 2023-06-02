import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone_flutter/core/model/like_model.dart';
import 'package:insta_clone_flutter/core/model/login_models.dart';

import '../model/posts_model.dart';
import '../services/app_api_service.dart';
import '../services/shared_pref_service.dart';
import '../util/helpers.dart';
import 'auth_controller.dart';

class FeedController extends GetxController with GetTickerProviderStateMixin {
  final _sharedService = Get.find<SharedPrefService>();
  final _authController = Get.find<AuthController>();

  var user = LoginResponseModel(isSuccess: false, errorMessage: "").obs;

  late AnimationController animationController;
  late Animation<double> scale;

  final _appApi = Get.find<AppApiService>();
  var isLoading = false.obs;

  var isAnimating = false.obs;
  Duration duration = const Duration(milliseconds: 150);

  Rx<List<Posts>> postList = Rx<List<Posts>>([]);
  var isPostLiked = false.obs;

  @override
  void onInit() async {
    user.value = await _sharedService.getUserInfo();
    await getAllPosts();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: duration.inMilliseconds ~/ 2),
    );
    scale = Tween<double>(begin: 1, end: 1.2).animate(animationController);
    super.onInit();
  }

  Future<void> getAllPosts() async {
    isLoading.value = true;
    var result = await _appApi.getAllPost();
    if (result.isEmpty) {
      showSnackBar1("Error", "No Post Exist");
    } else {
      postList.value = result;
    }
    isLoading.value = false;
  }

  Future<void> postLikes(
      int userId, int postUserId, int postId, bool like) async {
    if (postUserId == userId) return;
    var model = LikeModel(
        likeUserKey: userId,
        postUserKey: postUserId,
        postKey: postId,
        isLiked: like);

    var result = await _appApi.postLike(model);

    if (!result.isSuccess) {
      showSnackBar1("Error", result.errorMessage);
    } else {
      showSnackBar1("Success", 'like Success', type: SnackBarType.success);
    }
  }

  void logout() {
    _authController.logout();
  }
}
