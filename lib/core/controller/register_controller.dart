import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:insta_clone_flutter/app_routes.dart';
import 'package:insta_clone_flutter/core/model/register_model.dart';
import 'package:insta_clone_flutter/core/services/auth_api_service.dart';

import '../util/helpers.dart';

class RegisterController extends GetxController {

  final _authApi =Get.find<AuthApiService>();

  late final ImagePicker _imagePicker;
  late final ImageCropper _cropper;

  var profileImage = Rx<Uint8List?>(null);

  late TextEditingController userEmailController;
  late TextEditingController userNameController;
  late TextEditingController userPasswordController;
  late TextEditingController userConfirmPasswordController;

  var passwordShow = false.obs;
  var conformPasswordShow = false.obs;
  var showSaveProgress = false.obs;

  @override
  void onInit() {
    _imagePicker = ImagePicker();
    _cropper = ImageCropper();
    userEmailController = TextEditingController();
    userNameController = TextEditingController();
    userPasswordController = TextEditingController();
    userConfirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    userEmailController.dispose();
    userNameController.dispose();
    userPasswordController.dispose();
    userConfirmPasswordController.dispose();
    super.onClose();
  }

  Future<void> userRegister() async {
    if (!validateUser()) return;
    var model = RegisterModel(
      userEmail: userEmailController.text,
      userName: userNameController.text,
      userPassword: userPasswordController.text,
      userImage: profileImage.value == null
          ? ""
          : base64String(profileImage.value!),
    );

    showSaveProgress.value = true;
    var result = await _authApi.registerUser(model);
    if (result.isSuccess) {
      Get.offNamed(RouteNames.loginScreen);
      showSnackBar1("Success","Your Register Success. Please Login ",
          type: SnackBarType.success);
    } else {
      showSnackBar1("Failed", result.errorMessage.toString());
    }
    showSaveProgress.value = false;
  }


  bool validateUser() {
    if (userNameController.text.isEmpty) {
      showSnackBar1("Error", "Enter User name");
      return false;
    }
    if (userEmailController.text.isEmpty) {
      showSnackBar1("Error", "Enter Email Address");
      return false;
    }
    if (userPasswordController.text.isEmpty) {
      showSnackBar1("Error", "Enter Password");
      return false;
    }

    if (userConfirmPasswordController.text.isEmpty) {
      showSnackBar1("Error", "Enter ConfirmPassword");
      return false;
    }
    if (userConfirmPasswordController.text != userPasswordController.text) {
      showSnackBar1("Error", "ConfirmPassword or Password Not match");
      return false;
    }
    return true;
  }

  void getImage(ImageSource imageSource, Rx<Uint8List?> image) async {
    final selectImageFile = await _imagePicker.pickImage(source: imageSource);
    if (selectImageFile != null) {
      CroppedFile? croppedFile = await _cropper.cropImage(
        sourcePath: selectImageFile.path,
        aspectRatio: imageCropAspectRatio,
        maxHeight: 512,
        maxWidth: 512,
        uiSettings: [
          imageCropAndroidUISettings,
          imageCropIosUISettings,
        ],
      );
      image.value = File(croppedFile!.path).readAsBytesSync();
    } else {
      showSnackBar1('Error', 'No Image Selected');
    }
  }
}
