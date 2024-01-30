import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tehnikpompa/app/modules/daftarservis/bindings/daftarservis_binding.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/daftaerServisSayaModel.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/daftarServisModel.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/detailServiceModel.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/teknisiAllModel.dart';
import 'package:tehnikpompa/app/modules/daftarservis/service/daftarservis_service.dart';
import 'package:tehnikpompa/app/modules/daftarservis/views/detailServis.dart';
import 'package:tehnikpompa/app/modules/home/bindings/home_binding.dart';
import 'package:tehnikpompa/app/modules/home/views/home_view.dart';
import 'package:tehnikpompa/utils/messageUtils.dart';

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

  TextEditingController teknisi1 = TextEditingController();
  TextEditingController teknisi1Id = TextEditingController();
  TextEditingController teknisi2 = TextEditingController();
  TextEditingController teknisi2Id = TextEditingController();
  TextEditingController key1 = TextEditingController();
  TextEditingController key2 = TextEditingController();

  Rx<TextEditingController> searchTextController = TextEditingController().obs;
  ScrollController scrollController = ScrollController();
  RxInt totalPage = 0.obs;
  RxInt currentPage = 1.obs;
  var daftarServisModel = <DaftarServisModel?>[].obs;
  var daftarServisSayaModel = <DaftarServisSayaModel?>[].obs;
  DetailServisModel? detailServisModel;
  final selectedStatus = 1.obs;
  late Rx<TextEditingController> date;
  final Rx<DateTime>? selectedDate = DateTime.now().obs;
  var isLoading = false.obs;
  var listTeknisi1Search = <DaftarTeknisiModel?>[].obs;
  var listTeknisi2Search = <DaftarTeknisiModel?>[].obs;
  var listTeknisi1 = <DaftarTeknisiModel?>[].obs;
  var listTeknisi2 = <DaftarTeknisiModel?>[].obs;

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

  void clear() {
    teknisi1.clear();
    teknisi1Id.clear();
    teknisi1Id.clear();
    setSelected(1);
    teknisi2.clear();
    teknisi2Id.clear();
    key1.clear();
    key2.clear();
    searchTextController.value.clear();
  }

  ServisDetail(String serviceId) async {
    EasyLoading.show(
        status: "Mohon Tunggu. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      var response = await DaftarServisService().detailService(serviceId);
      log(response.body.toString());

      if (response.body != null) {
        if (response.body['message'] == 'Berhasil') {
          log('berhasil');
          detailServisModel = DetailServisModel.fromJson(response.body['data']);
          Get.to(() => DetailServis(), binding: DaftarservisBinding());
          EasyLoading.dismiss();
        } else {
          MessageUtils.general(text: 'Terjadi Kesalahan');
          EasyLoading.dismiss();
        }
      }
    } catch (e) {
      log(e.toString());
      MessageUtils.general(text: 'Terjadi Kesalahan Pada Server');
      EasyLoading.dismiss();
    }
    EasyLoading.dismiss();
  }

  getDaftarServis(int status, String namaProject, String date, int page) async {
    EasyLoading.show(
        status: "Mencari Proyek. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      var response = await DaftarServisService()
          .getDaftarServis(status, namaProject, date, page);
      log('awok' + response.toString());
      if (response != []) {
        daftarServisModel.value = response;
        log(daftarServisModel.toString());
      }
      //   DaftarServisService()
      //     .getDaftarServis(status, namaProject, date, page)
      //     .then((value) async {
      //   log('awok' + value.toString());
      //   if (value != []) {
      //     daftarServisModel.value = value;

      //     log(daftarServisModel.toString());
      //   }
      // });
    } catch (e) {
      errorSnackBar('Gagal', e.toString());
    }
    EasyLoading.dismiss();
  }

  getDaftarServisUser(String roleId, String userId, int page) async {
    EasyLoading.show(
        status: "Mencari Proyek. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      var response =
          await DaftarServisService().getDaftarServisUser(roleId, userId, page);
      log('awok' + response.toString());
      if (response != []) {
        daftarServisSayaModel.value = response;
        log(daftarServisSayaModel.toString());
      }
      // DaftarServisService()
      //     .getDaftarServisUser(roleId, userId, page)
      //     .then((value) async {
      //   log('awok' + value.toString());
      //   if (value != []) {
      //     daftarServisSayaModel.value = value;
      //     log(daftarServisModel.toString());
      //   }
      // });
    } catch (e) {
      errorSnackBar('Gagal', e.toString());
    }
    EasyLoading.dismiss();
  }

  Future getTeknisi(bool isLoad, String teknisi) async {
    try {
      if (isLoad) isLoading.value = true;
      teknisi == '1'
          ? await DaftarServisService().getListTeknisi().then((value) async {
              log('masuk');
              if (value!.isNotEmpty) {
                listTeknisi1.value = value;
                listTeknisi1Search.value = value;
              }
              isLoading.value = false;
              update();
            })
          : await DaftarServisService().getListTeknisi().then((value) async {
              log('masuk2');
              if (value!.isNotEmpty) {
                listTeknisi2.value = value;
                listTeknisi2Search.value = value;
              }
              isLoading.value = false;
              update();
            });
    } catch (e) {}
  }

  Future updateStatus(String serviceId, String status) async {
    EasyLoading.show(
        status: "Mohon Tunggu. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      var response =
          await DaftarServisService().updateStatusService(serviceId, status);
      if (response.body['message'] == 'Berhasil') {
        snackBar('Berhasil', 'Service anda telah diperbaharui!');
        Get.to(HomeView(), binding: HomeBinding());
        EasyLoading.dismiss();
      }
    } catch (e) {
      errorSnackBar('Gagal', e.toString());

      throw (e);
    }
    EasyLoading.dismiss();
  }

  Future updateTeknisi(
      String serviceId, String teknisi1, String teknisi2) async {
    EasyLoading.show(
        status: "Mohon Tunggu. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      var response = await DaftarServisService()
          .updateTeknisiService(serviceId, teknisi1, teknisi2);
      if (response.body['message'] == 'Berhasil') {
        snackBar('Berhasil', 'Service anda telah diperbaharui!');
        Get.to(HomeView(), binding: HomeBinding());
        EasyLoading.dismiss();
      }
    } catch (e) {
      errorSnackBar('Gagal', e.toString());

      throw (e);
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
