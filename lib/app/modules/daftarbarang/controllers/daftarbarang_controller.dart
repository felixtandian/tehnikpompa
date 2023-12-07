import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/models/daftarBarangModel.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/models/listKategoriModel.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/models/modelbarang.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/service/daftarBarangService.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/widgets/itemfetcher.dart';
import 'package:tehnikpompa/utils/constant.dart';
import 'package:dio/dio.dart';

class DaftarbarangController extends GetxController {
  //TODO: Implement DaftarbarangController
  List<Model> list = [];
  ScrollController scrollController = ScrollController();
  
  int listLength = 6;
  final dio = Dio();
  final pairList = <WordPair>[];
  final biggerFont = const TextStyle(fontSize: 18.0);
  final itemFetcher = ItemFetcher();
  RxInt totalPage = 0.obs;
  RxInt currentPage = 1.obs;
  RxBool isLoading = true.obs;
  RxBool hasMore = true.obs;
  RxList daftarBarangModel = <DaftarBarangModel?>[].obs;
  RxList kategoriModel = <KategoriModel?>[].obs;
  final selectedLokasi = 'Semarang'.obs;
  RxString selectedCategory = 'ACCESORIES PANEL'.obs ;

  RxInt lokasi = 1.obs;
  Rx<TextEditingController> searchTextController = TextEditingController().obs;
  RxList<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Semarang"), value: 'Semarang'),
      const DropdownMenuItem(child: Text("Jogjakarta"), value: "Jogjakarta"),
    ];
    return menuItems.obs;
  }

  void loadMore() {
    isLoading.value = true;
    itemFetcher.fetch().then((List<WordPair> fetchedList) {
      if (fetchedList.isEmpty) {
        isLoading.value = false;
        hasMore.value = false;
      } else {
        isLoading.value = false;
        pairList.addAll(fetchedList);
      }
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    isLoading.value = true;
    hasMore.value = true;
    generateList();
    addItems();
    super.onInit();
  }

  generateList() {
    list = List.generate(
        listLength, (index) => Model(name: (index + 1).toString()));
  }

  addItems() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        for (int i = 0; i < 2; i++) {
          listLength++;
          list.add(Model(name: (listLength).toString()));
          update(); //update GetBuilder each time
        }
      }
    });
  }

  void setSelected(String value) {
    selectedLokasi.value = value;
  }

  void setSelectedKategori(String value){
    selectedCategory.value = value;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future getDaftarBarang(int lokasi, String key, String jenis, int page) async {
    EasyLoading.show(
        status: "Mencari Barang. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      DaftarBarangService()
          .getDaftarBarang(lokasi, key, jenis, page)
          .then((value) async {
        log(value.toString());
        if (value != []) {
          daftarBarangModel.value = value;
          log(daftarBarangModel.toString());
        }
      });
    } catch (e) {
      errorSnackBar('Gagal', e.toString());
    }
    EasyLoading.dismiss();
  }

  Future getKategori() async {
    EasyLoading.show(
        status: "Mencari Kategori. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      DaftarBarangService()
          .getKategori()
          .then((value) async {
        log(value.toString());
        if (value != []) {
          kategoriModel.value = value;
          log(kategoriModel.toString());
        }
      });
    } catch (e) {
      errorSnackBar('Gagal', e.toString());
    }
    EasyLoading.dismiss();
  }

  // Future<List<KategoriModel>> getCategory() async {
  //   var url = Constants.baseURL + 'listKategoriBarang';
  //   try {
  //     final response = await dio
  //         .get(url);
  //     final body = json.decode(response) as List;

  //     if (response.statusCode == 200) {
  //       return body.map((e) {
  //         final map = e as Map<String, dynamic>;
  //         return KategoriModel(
  //             kodeKtgrBarang: map["kodeKtgrBarang"], namaKtgrBarang: map["namaKtgrBarang"]);
  //       }).toList();
  //     }
  //   } on SocketException {
  //     throw Exception("Network Connectivity Error");
  //   }
  //   throw Exception("Fetch Data Error");
  // }

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
