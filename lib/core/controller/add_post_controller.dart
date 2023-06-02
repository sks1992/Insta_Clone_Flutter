import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone_flutter/core/controller/auth_controller.dart';

import '../model/login_models.dart';
import '../model/posts_model.dart';
import '../services/app_api_service.dart';
import '../services/shared_pref_service.dart';
import '../util/helpers.dart';

class AddPostController extends GetxController {
  final _appApi = Get.find<AppApiService>();
  final _sharedService = Get.find<SharedPrefService>();

  final _authController =Get.find<AuthController>();

  late final ImagePicker _imagePicker;
  late final ImageCropper _cropper;

  var postImage = Rx<Uint8List?>(null);
  late TextEditingController captionController;

  var isLoading = false.obs;
  late LoginResponseModel user;

  @override
  void onInit() async {
    captionController = TextEditingController();
    _imagePicker = ImagePicker();
    _cropper = ImageCropper();
    user = await _sharedService.getUserInfo();
    super.onInit();
  }

  @override
  void onClose() {
    captionController.dispose();
    super.onClose();
  }

  void logout(){
    _authController.logout();
  }

  Future<void> postReal() async {
    if (!validateUser()) return;
    var model = CreatePostModel(
      userId: user.userId!,
      postDescription: captionController.text,
      postImageUrl:
          postImage.value == null ? "" : base64String(postImage.value!),
    );

    isLoading.value = true;
    var result = await _appApi.createPostReal(model);
    if (result.isSuccess) {
      postImage.value = null;
      captionController.text = '';
    } else {
      showSnackBar1("Failed", result.errorMessage.toString());
    }
    isLoading.value = false;
  }

  bool validateUser() {
    if (captionController.text.isEmpty) {
      showSnackBar1("Error", "Enter Caption");
      return false;
    }

    if (postImage.value == null) {
      showSnackBar1("Error", "Select Image");
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
