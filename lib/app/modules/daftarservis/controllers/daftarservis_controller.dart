import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/daftarServisModel.dart';
import 'package:tehnikpompa/app/modules/daftarservis/service/daftarservis_service.dart';

class DaftarservisController extends GetxController {
  //TODO: Implement DaftarservisController

  List<List<String>> listsData = [
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'BUDI'],
    ['SEMARANG', '2023-11-14', 'SEMARANG', 'PENDING', 'AGUS'],
    ['YOGYAKARTA', '2023-11-14', 'YOGYAKARTA', 'PENDING', 'RIO'],
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'TOMMY'],
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'YUDI'],
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'NICHO'],
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'NICO'],
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'FELIX'],
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'IVAN'],
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'LUDWIG'],
  ];

  Rx<TextEditingController> searchTextController = TextEditingController().obs;
  ScrollController scrollController = ScrollController();
  RxInt totalPage = 0.obs;
  RxInt currentPage = 1.obs;
  RxList daftarServisModel = <DaftarServisModel?>[].obs;
  final selectedStatus = 1.obs;
  late Rx<TextEditingController> date;
  final Rx<DateTime>? selectedDate = DateTime.now().obs;

  RxList<DropdownMenuItem<int>> get dropdownItems2 {
    List<DropdownMenuItem<int>> menuItems = [
      const DropdownMenuItem(child: Text("Pending"), value: 1),
      const DropdownMenuItem(child: Text("Assigned"), value: 2),
      const DropdownMenuItem(child: Text("Unfinished"), value: 3),
      const DropdownMenuItem(child: Text("Finished"), value: 4),
      const DropdownMenuItem(child: Text("Canceled"), value: 5),
      const DropdownMenuItem(child: Text("Deleted"), value: 6),
    ];
    return menuItems.obs;
  }

 void setSelected(int value) {
    selectedStatus.value = value;
  }

  final count = 0.obs;
  @override
  void onInit() {
    
    date = TextEditingController().obs;
    date.value.text = '';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;


    Future getDaftarServis(int status, String namaProject, String date, int page) async {
    EasyLoading.show(
        status: "Mencari Proyek. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      DaftarServisService()
          .getDaftarServis(status, namaProject, date, page)
          .then((value) async {
        log('awok' + value.toString());
        if (value != []) {
          daftarServisModel.value = value;
          log(daftarServisModel.toString());
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
