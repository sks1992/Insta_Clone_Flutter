import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePickerCropper extends StatelessWidget {
  const ImagePickerCropper(
      {Key? key,
      required this.imageData,
      this.labelText = "Get Photo",
      required this.getImageFromCamera,
      required this.getImageFromGallery})
      : super(key: key);

  final Rx<Uint8List?> imageData;
  final String labelText;
  final Function getImageFromCamera;
  final Function getImageFromGallery;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(
          () => imageData.value == null
              ? Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200)),
                  child: Image.asset("assets/images/no_image.png"),
                )
              : Image.memory(
                  imageData.value!,
                  width: 50,
                  height: 60,
                ),
        ),
        const SizedBox(
          width: 16,
        ),
        OutlinedButton(
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
                            getImageFromCamera();
                            Get.back();
                          },
                          child: Column(
                            children: const [
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
                            getImageFromGallery();
                            Get.back();
                          },
                          child: Column(
                            children: const [
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
                        ))
                  ],
                ),
              );
            },
            child: Row(
              children: [
                const Icon(Icons.camera_alt),
                const SizedBox(width: 5),
                Text(labelText),
              ],
            )),
      ],
    );
  }
}
