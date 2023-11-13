import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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

  final count = 0.obs;
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
}
