import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/models/daftarBarangModel.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/models/modelbarang.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/service/daftarBarangService.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/widgets/itemfetcher.dart';

class DaftarbarangController extends GetxController {
  //TODO: Implement DaftarbarangController
  List<Model> list = [];
  ScrollController scrollController = ScrollController();
  int listLength = 6;

  final pairList = <WordPair>[];
  final biggerFont = const TextStyle(fontSize: 18.0);
  final itemFetcher = ItemFetcher();
  RxBool isLoading = true.obs;
  RxBool hasMore = true.obs;
  RxList daftarBarangModel = <DaftarBarangModel?>[].obs;


  List<List<String>> listsData = [
    ['ELECTRODE MASSA', 'E-MASSA', '201', '0', '0'],
    ['MCB 20 AMP 1POLE', 'MCB20A', '0', '0', '0'],
    ['PFR MINILEC', 'PFRMINI', '0', '0', '0'],
    ['WLC P1 MINILEC', 'WLCP1MINI', '220', '0', '0'],
    ['STEPPING RELAY + SOCKET', 'STEPPING RELAY', '0', '0', '0'],
    ['LCP W/ POTENTIOMETER DANFOSS', '0', 'SOLO', '0', '0'],
    ['CABLE PLUG', 'CP', '0', '0', '0'],
    ['OVERLOAD CHINT 23-32A', '0', '0', '0', '0'],
    ['PFR S2VMR', 'PFRS2VMR', '0', '0', '0'],
    ['MAGNETIC ONTACTOR LC1 D09M7 220V TELEMACANIC', 'MOLDT', '0', '0', '0'],
  ];

  Rx<TextEditingController> searchTextController = TextEditingController().obs;

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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  
  Future getDaftarBarang(int lokasi,String key, String jenis,int page) async {
    
    EasyLoading.show(
        status: "Mencari Barang. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try{
      DaftarBarangService().getDaftarBarang(lokasi, key, jenis, page).then((value) async{
        log(value.toString());
        if(value != []){
          daftarBarangModel.value = value;
          log(daftarBarangModel.toString());
        }
      });
    }catch(e){
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
