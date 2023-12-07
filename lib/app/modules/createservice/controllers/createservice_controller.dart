import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

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
    tglKerja.value.text = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
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
  
   void setSelected(String value){
     selectedServis.value = value;
   }
}
