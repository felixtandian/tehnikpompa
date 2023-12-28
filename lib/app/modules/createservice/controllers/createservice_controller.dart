import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tehnikpompa/app/modules/createservice/services/createServices.dart';
import 'package:tehnikpompa/app/modules/home/bindings/home_binding.dart';
import 'package:tehnikpompa/app/modules/home/views/home_view.dart';

class CreateserviceController extends GetxController {
  //TODO: Implement CreateserviceController

  final globalKey = GlobalKey<FormState>();

  late TextEditingController namaServis;
  late TextEditingController nomorTelepon;
  late TextEditingController email;
  late TextEditingController lokasi;
  late TextEditingController tipePompa;
  late TextEditingController masalah;
  late TextEditingController cpName;
  late TextEditingController cpPhone;
  late TextEditingController umrPompa;
  late TextEditingController jmlPompa;
  late TextEditingController rekomTeknisi;
  late Rx<TextEditingController> jenisServis;
  late Rx<TextEditingController> tglKerja;
  final ImagePicker imgpicker = ImagePicker();
  RxList<XFile>? imagefiles = <XFile>[].obs;

  RxInt p = 1.obs;
  RxInt c = 1.obs;
  final count = 0.obs;
  final selectedServis = 'Service'.obs;
  final Rx<DateTime>? selectedDate = DateTime.now().obs;

  RxList<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Service"), value: "Service"),
      const DropdownMenuItem(child: Text("Supervision"), value: "Supervision"),
    ];
    return menuItems.obs;
  }

  @override
  void onInit() {
    namaServis = TextEditingController();
    nomorTelepon = TextEditingController();
    lokasi = TextEditingController();
    email = TextEditingController();
    tipePompa = TextEditingController();
    masalah = TextEditingController();
    cpName = TextEditingController();
    cpPhone = TextEditingController();
    jmlPompa = TextEditingController();
    umrPompa = TextEditingController();
    rekomTeknisi = TextEditingController();
    jenisServis = TextEditingController().obs;
    jenisServis.value.text = 'Service';
    tglKerja = TextEditingController().obs;
    tglKerja.value.text =
        DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
    super.onInit();
  }

  void clear() {
    namaServis.clear();
    nomorTelepon.clear();
    lokasi.clear();
    email.clear();
    tipePompa.clear();
    cpName.clear();
    cpPhone.clear();
    jmlPompa.clear();
    namaServis.clear();
    umrPompa.clear();
    rekomTeknisi.clear();
    jenisServis.value.clear();
    imagefiles!.value = [];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setSelected(String value) {
    selectedServis.value = value;
  }

  Future cServiceController(
      String images,
      String serviceType,
      String namaService,
      String noTelp,
      String tipePompa,
      String lokasi,
      String notes,
      String jmlPompa,
      String umurPompa,
      String namaCp,
      String telpCp,
      String rekomTeknisi,
      String teknisi1,
      String teknisi2,
      String userId) async {
    EasyLoading.show();
    try {
      CreateServices()
          .createService(
              images,
              serviceType,
              namaService,
              noTelp,
              tipePompa,
              lokasi,
              notes,
              jmlPompa,
              umurPompa,
              namaCp,
              telpCp,
              rekomTeknisi,
              teknisi1,
              teknisi2,
              userId)
          .then((value) async {
        log(value.body.toString());
        if (value.body['message'] == 'Berhasil Submit Service') {
          Get.to(() => HomeView(), binding: HomeBinding());
          snackBar('Sukses!',
              'Service anda berhasil di buat silahkan cek di service anda.');
        } else if (value.body['message'] != 'Berhasil Submit Service') {
          errorSnackBar('Gagal!', value.body['message']);
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
