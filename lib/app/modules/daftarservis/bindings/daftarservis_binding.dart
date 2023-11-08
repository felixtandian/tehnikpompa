import 'package:get/get.dart';

import '../controllers/daftarservis_controller.dart';

class DaftarservisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarservisController>(
      () => DaftarservisController(),
    );
  }
}
