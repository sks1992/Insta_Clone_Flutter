import 'package:get/get.dart';

import '../model/posts_model.dart';
import '../services/app_api_service.dart';
import '../util/helpers.dart';

class FeedController extends GetxController {
  final _appApi = Get.find<AppApiService>();
  var isLoading = false.obs;

  @override
  void onInit() async {
    await getAllPosts();
    super.onInit();
  }

  Rx<List<Posts>> postList = Rx<List<Posts>>([]);

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
}
