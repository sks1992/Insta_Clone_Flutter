import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';
import '../../core/controller/login_controller.dart';
import '../widgets/new_elevatedButton.dart';
import '../widgets/text_input.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = Get.put(LoginController());

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
                SizedBox(height: Get.height * 0.1),
                Image.asset(
                  "assets/insta_logo.png",
                  height: 100,
                ),
                const SizedBox(height: 64),
                InputText(
                  controller: controller.emailOrMobileNoOrUserNameController,
                  labelText: "Enter User Name",
                ),
                const SizedBox(height: 16),
                InputText(
                  controller: controller.passwordController,
                  labelText: "Enter Password",
                  obscureText: true,
                ),
                Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : NewElevatedButton(
                          label: "Login",
                          onPressed: () async {
                            await controller.login();
                          },
                        ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "If You Don't Have Account. ",
                      style: TextStyle(fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        Get.offNamed(RouteNames.registerScreen);
                      },
                      child: const Text(
                        "Register ",
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
