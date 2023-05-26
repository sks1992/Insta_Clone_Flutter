import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone_flutter/core/controller/feed_controller.dart';

import '../widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({Key? key}) : super(key: key);

  final controller = Get.put(FeedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/insta_logo1.png',
          height: AppBar().preferredSize.height - 8,
          fit: BoxFit.cover,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.messenger),
          ),
        ],
      ),
      body:Obx(()=> controller.postList.value.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.postList.value.length,
              itemBuilder: (ctx, index) => PostCard(
                post: controller.postList.value[index],
              ),
            ),),
    );
  }
}
