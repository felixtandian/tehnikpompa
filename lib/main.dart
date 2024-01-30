import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tehnikpompa/app/modules/loginscreen/controllers/loginscreen_controller.dart';
import 'package:tehnikpompa/app/routes/app_pages.dart';
import 'package:tehnikpompa/utils/prefController.dart';

PrefController prefC = Get.put(PrefController());

void main() async{
  await GetStorage.init();
  log(prefC.isLogin.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tehnik Pompa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.routes,
      initialRoute: "/",
      builder: EasyLoading.init(),
    );
  }
}

