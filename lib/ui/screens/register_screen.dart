import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone_flutter/app_routes.dart';

import '../../core/controller/register_controller.dart';
import '../widgets/new_elevatedButton.dart';
import '../widgets/text_input.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  "assets/insta_logo1.png",
                  height: 130,
                ),
                Stack(
                  children: [
                    Obx(
                          () => controller.profileImage.value == null
                          ? const CircleAvatar(
                        radius: 64,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/no_image.png"),
                      )
                          : CircleAvatar(
                        radius: 64,
                        backgroundColor: Colors.white,
                        backgroundImage:
                        MemoryImage(controller.profileImage.value!),
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      right: -10,
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
                                        controller.getImage(ImageSource.camera,
                                            controller.profileImage);
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
                                        controller.getImage(ImageSource.gallery,
                                            controller.profileImage);
                                        Get.back();
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
                        icon: const Icon(Icons.camera_alt),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                InputText(
                  controller: controller.userNameController,
                  labelText: "Enter User Name",
                ),
                const SizedBox(height: 16),
                InputText(
                  controller: controller.userEmailController,
                  labelText: "Enter Email",
                ),
                const SizedBox(height: 16),
                InputText(
                  controller: controller.userPasswordController,
                  labelText: "Enter Password",
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                InputText(
                  controller: controller.userConfirmPasswordController,
                  labelText: "Enter Confirm Password",
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                NewElevatedButton(
                  label: "Register",
                  onPressed: () async  {
                   await controller.userRegister();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "If You Have Account. ",
                      style: TextStyle(fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        Get.offNamed(RouteNames.loginScreen);
                      },
                      child: const Text(
                        "Login ",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                    const Text(
                      "Here !",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
