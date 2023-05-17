import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone_flutter/core/controller/dashboard_controller.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);

  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: controller.homeScreenItems,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.transparent,
        items: [
          BottomNavigationBarItem(
            icon:Obx(()=> Icon(
              Icons.home,
              color:
                  (controller.pages.value == 0) ? Colors.black87 : Colors.grey,
            ),),
            label: '',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
              icon:Obx(()=> Icon(
                Icons.search,
                color: (controller.pages.value == 1)
                    ? Colors.black87
                    : Colors.grey,
              ),),
              label: '',
              backgroundColor: Colors.black87),
          BottomNavigationBarItem(
              icon:Obx(()=> Icon(
                Icons.add_circle,
                color: (controller.pages.value == 2)
                    ? Colors.black87
                    : Colors.grey,
              ),),
              label: '',
              backgroundColor: Colors.black87),
          BottomNavigationBarItem(
            icon:Obx(()=> Icon(
              Icons.favorite,
              color:
                  (controller.pages.value == 3) ? Colors.black87 : Colors.grey,
            ),),
            label: '',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon:Obx(()=> Icon(
              Icons.person,
              color:
                  (controller.pages.value == 4) ? Colors.black87 : Colors.grey,
            ),),
            label: '',
            backgroundColor: Colors.black87,
          ),
        ],
        onTap: controller.navigationTapped,
        currentIndex: controller.pages.value,
      ),
    );
  }
}
