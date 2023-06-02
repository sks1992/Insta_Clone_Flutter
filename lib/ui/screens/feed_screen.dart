import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone_flutter/core/controller/feed_controller.dart';

import '../../core/util/helpers.dart';
import '../widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({Key? key}) : super(key: key);

  final controller = Get.put(FeedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.user.value.userName == "" ||
                    controller.user.value.userName == null
                ? ""
                : controller.user.value.userName!,
          ),
        ),
        leading: Obx(
          () => controller.user.value.userImage == "" ||
                  controller.user.value.userImage == null
              ? const CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/no_image.png"),
                )
              : CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.white,
                  backgroundImage: MemoryImage(
                    base64Decode(
                      base64String(
                        dataFromBase64String(controller.user.value.userImage!),
                      ),
                    ),
                  ),
                ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(
        () => controller.postList.value.isEmpty
            ? const Center(
                child: Text("No Posts Exist"),
              )
            : ListView.builder(
                itemCount: controller.postList.value.length,
                itemBuilder: (ctx, index) => PostCard(
                  post: controller.postList.value[index],
                  controller: controller,
                ),
              ),
      ),
    );
  }
}
