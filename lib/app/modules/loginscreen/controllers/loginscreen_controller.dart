import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginscreenController extends GetxController {
  //TODO: Implement LoginscreenController

  final count = 0.obs;
  late Rx<TextEditingController> password = TextEditingController().obs;
  late Rx<TextEditingController> email = TextEditingController().obs;
  RxBool showPassword = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void toggleVisibility() {
      showPassword.value = !showPassword.value;
  }
}
