import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  List<Widget> homeScreenItems = [
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Post"),
    ),
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
}
