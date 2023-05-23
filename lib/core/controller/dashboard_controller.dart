import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../ui/screens/add_post_screen.dart';
import '../../ui/screens/feed_screen.dart';
import 'auth_controller.dart';

class DashboardController extends GetxController {
  final _auth = Get.find<AuthController>();

  List<Widget> homeScreenItems = [
    FeedScreen(),
    const Center(
      child: Text("Search"),
    ),
    AddPostScreen(),
    const Center(
      child: Text("Like"),
    ),
    const Center(
      child: Text("Profile"),
    ),
  ];

  var pages = 0.obs;

  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int page) {
    pages.value = page;
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void logout() {
    _auth.logout();
  }
}
