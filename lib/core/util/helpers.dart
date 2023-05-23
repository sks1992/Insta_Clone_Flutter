import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';


void hideKeyboard() {
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

String getHttpStatusMessage(Response response) {
  if (response.status.connectionError) {
    return "Connection Error";
  } else if (response.status.isUnauthorized) {
    return "Session expired. Please logout and login again.";
  } else if (response.status.isServerError) {
    return "Request failed";
  } else {
    if (response.body == null) {
      return "Error while request.";
    }
    if (response.body is String) {
      final body = json.decode(response.body);
      final errors = body["errors"];
      if (errors != null && errors is Map<String, dynamic>) {
        final Map<String, dynamic> messages = Map.from(errors);
        String message = "";
        messages.forEach((key, value) {
          message += "$key - $value\n";
        });
        return message;
      }
      return errors.toString();
    }
    return response.body["error_description"] ??
        response.body["error"] ??
        "Error while request.";
  }
}

enum SnackBarType { info, error, success }

void showSnackBar1(String title, String message,
    {SnackBarType type = SnackBarType.info, Function? onOkClick}) {
  Color bgColor = Colors.red;
  Color textColor = Colors.white;
  Color buttonColor = Colors.white;

  switch (type) {
    case SnackBarType.info:
      break;
    case SnackBarType.error:
      bgColor = Colors.red;
      textColor = Colors.white;
      buttonColor = textColor;
      break;
    case SnackBarType.success:
      bgColor = Colors.green;
      textColor = Colors.white;
      buttonColor = textColor;
      break;
  }

  Get.snackbar(
    title,
    message,
    backgroundColor: bgColor,
    colorText: textColor,
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 0,
    duration: const Duration(seconds: 10),
    animationDuration: const Duration(milliseconds: 650),
    mainButton: TextButton(
      onPressed: () async {
        if (onOkClick != null) {
          await onOkClick();
          Get.closeAllSnackbars();
        } else {
          Get.closeAllSnackbars();
        }
      },
      child: Text(
        "OK",
        style: TextStyle(color: buttonColor),
      ),
    ),
  );
}

CropAspectRatio get imageCropAspectRatio =>
    const CropAspectRatio(ratioX: 1.0, ratioY: 1.0);

AndroidUiSettings get imageCropAndroidUISettings => AndroidUiSettings(
    toolbarTitle: 'Crop Image',
    toolbarColor: Colors.white,
    toolbarWidgetColor: Colors.black87,
    initAspectRatio: CropAspectRatioPreset.original,
    lockAspectRatio: false);

IOSUiSettings get imageCropIosUISettings => IOSUiSettings(
      title: 'Crop Image',
      minimumAspectRatio: 1.0,
    );

String base64String(Uint8List data) {
  return base64Encode(data);
}

Image imageFromBase64String(String base64String) {
  return Image.memory(base64Decode(base64String));
}

Uint8List dataFromBase64String(String base64String) {
  return base64Decode(base64String
      .replaceAll("data:image/png;base64,", "")
      .replaceAll("data:image/jpg;base64,", "")
      .replaceAll("data:image/jpeg;base64,", ""));
}