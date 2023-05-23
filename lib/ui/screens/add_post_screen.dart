import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone_flutter/core/util/helpers.dart';

import '../../core/controller/add_post_controller.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({Key? key}) : super(key: key);
  final controller = Get.put(AddPostController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.postImage.value == null
          ? Center(
              child: IconButton(
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text("Choose"),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: Get.height * 0.1,
                            child: InkWell(
                              onTap: () {
                                controller.getImage(
                                    ImageSource.camera, controller.postImage);
                                Get.back();
                              },
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.photo_camera,
                                      color: Colors.grey,
                                      size: 35,
                                    ),
                                  ),
                                  Text(
                                    "Camera",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.1,
                            child: InkWell(
                              onTap: () {
                                controller.getImage(
                                    ImageSource.gallery, controller.postImage);
                                Get.back();
                              },
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.image,
                                      color: Colors.grey,
                                      size: 35,
                                    ),
                                  ),
                                  Text(
                                    "Gallery",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            "CLOSE",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.upload),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                title: const Text("Post To"),
                leading: IconButton(
                  onPressed: () {
                    controller.postImage.value = null;
                    controller.captionController.text = '';
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      await controller.postReal();
                    },
                    child: const Text(
                      "Post",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    controller.isLoading.value
                        ? const LinearProgressIndicator()
                        : Container(),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.user.userImage == null
                            ? const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/background.jpg'),
                              )
                            : CircleAvatar(
                                backgroundImage: MemoryImage(base64Decode(
                                    base64String(dataFromBase64String(
                                        controller.user.userImage!)))),
                              ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: Get.width * .45,
                          child: TextField(
                            controller: controller.captionController,
                            decoration: const InputDecoration(
                                hintText: 'Write a caption...',
                                border: InputBorder.none),
                            maxLines: 4,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    SizedBox(
                      width: Get.width,
                      height: Get.height * 0.5,
                      child: AspectRatio(
                        aspectRatio: 487 / 541,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: MemoryImage(controller.postImage.value!),
                                fit: BoxFit.fill,
                                alignment: FractionalOffset.topCenter),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
