import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageUtils {
  static general({required String text}) async {
    if (Get.isSnackbarOpen) {
      await Get.closeAllSnackbars;
      return;
    }
    Get.showSnackbar(GetSnackBar(
      message: "$text",
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.all(20),
      borderRadius: 10,
      duration: Duration(seconds: 3),
      animationDuration: Duration(seconds: 3),
      backgroundColor: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
    ));
  }

  static success({required String text}) async {
    if (Get.isSnackbarOpen) {
      await Get.closeAllSnackbars;
      return;
    }
    Get.showSnackbar(GetSnackBar(
      message: "$text",
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.all(20),
      borderRadius: 10,
      duration: Duration(seconds: 3),
      animationDuration: Duration(milliseconds: 500),
      backgroundColor: Colors.grey.shade800,
      snackPosition: SnackPosition.BOTTOM,
    ));
  }

  static failed({required String text}) async {
    if (Get.isSnackbarOpen) {
      await Get.closeAllSnackbars;
      return;
    }
    Get.showSnackbar(GetSnackBar(
      message: "$text",
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.all(20),
      borderRadius: 10,
      duration: Duration(seconds: 3),
      animationDuration: Duration(milliseconds: 500),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    ));
  }
}
