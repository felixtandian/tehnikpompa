import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
  List<File> selectedImages = []; // List of selected image
  final picker = ImagePicker(); // Instance of Image picker
  RxInt p = 1.obs;
  RxInt c = 1.obs;
  final count = 0.obs;
  final selectedServis = 'Service'.obs;

  List<String> servis = ['Service', 'Suprvision'];
  
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
