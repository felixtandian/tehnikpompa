import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateserviceController extends GetxController {
  //TODO: Implement CreateserviceController

  final globalKey = GlobalKey<FormState>();

  late TextEditingController KodeMember;
  late TextEditingController NomorTelepon;
  late TextEditingController Email;
  late TextEditingController NomorKTP;
  late TextEditingController Referensi;

  final count = 0.obs;
  @override
  void onInit() {
    NomorTelepon = TextEditingController();
    NomorKTP = TextEditingController();
    Email = TextEditingController();
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
