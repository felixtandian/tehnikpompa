import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tehnikpompa/app/modules/home/bindings/home_binding.dart';
import 'package:tehnikpompa/app/modules/home/views/home_view.dart';
import 'package:tehnikpompa/app/modules/loginscreen/models/userModel.dart';
import 'package:tehnikpompa/app/modules/loginscreen/services/loginservices.dart';
import 'package:tehnikpompa/utils/prefController.dart';

class LoginscreenController extends GetxController {
  //TODO: Implement LoginscreenController
  final prefController = Get.put(PrefController());
  LoginServices loginServices = LoginServices();
  final count = 0.obs;
  late Rx<TextEditingController> password = TextEditingController().obs;
  late Rx<TextEditingController> email = TextEditingController().obs;
  UserModel? userModel;
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

  loginController(String email, String password) async {
       EasyLoading.show(
        status: "Mohon Tunggu. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      var response = await loginServices.loginService(email, password);
        log(response.body.toString());
        if (response.body['message'] == 'Sukses') {
          var data = UserModel.fromJson(response.body['data']);
          userModel = data;
          prefController.setIsLogin(true);
          prefController.setName(userModel!.shortName);
          prefController.setMemberId(userModel!.id.toString());
          prefController.setMemberRoleId(userModel!.roleId.toString());
          prefController.setEmail(userModel!.email);
          prefController.setPhoneNumber(userModel!.noHp);   
          if(userModel!.roleId == 1){
            prefController.setSuper(true);
          }else if(userModel!.roleId == 2){
            prefController.setSales(true);
          }else{
            prefController.setTeknisi(true);
          }
          Get.to(HomeView(), binding: HomeBinding());
        } else if (response.body['message'] == 'Gagal') {
          if (response.body['data'] == 'Email Tidak Terdaftar !') {
            errorSnackBar('Email invalid !', response.body['data'].toString());
          } else if (response.body['data'] ==
              'Cek kembali email / Password anda !') {
            errorSnackBar('Password invalid !', response.body['data'].toString());
          }
        }
    } catch (e) {
      log(e.toString());
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
