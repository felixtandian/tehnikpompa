import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tehnikpompa/app/modules/home/bindings/home_binding.dart';
import 'package:tehnikpompa/app/modules/home/controllers/home_controller.dart';
import 'package:tehnikpompa/app/modules/home/views/home_view.dart';
import 'package:tehnikpompa/app/modules/loginscreen/services/loginservices.dart';

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

  Future loginController(String email, String password) async {
    EasyLoading.show();
    try {
      LoginServices().loginService(email, password).then((value) async {
        log(value.body.toString());
        if (value.body['message'] == 'Sukses') {
          Get.to(HomeView(), binding: HomeBinding());
        } else if (value.body['message'] == 'Gagal') {
          if (value.body['data'] == 'Email Tidak Terdaftar !') {
            errorSnackBar('Email invalid !', value.body['data'].toString());
          } else if (value.body['data'] ==
              'Cek kembali email / Password anda !') {
            errorSnackBar('Password invalid !', value.body['data'].toString());
          }
        }
      });
    } catch (e) {
      errorSnackBar('Gagal', e.toString());
    }
    EasyLoading.dismiss();
  }

  void snackBar(String judul, String msg) {
    Get.snackbar(judul, msg,
        colorText: Colors.white,
        backgroundColor: Colors.green[600],
        duration: Duration(seconds: 3));
  }

  void errorSnackBar(String judul, String msg) {
    Get.snackbar(judul, msg,
        colorText: Colors.white,
        backgroundColor: Colors.red[600],
        duration: Duration(seconds: 3));
  }
}
