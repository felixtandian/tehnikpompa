import 'package:get/get.dart';

import '../controllers/daftarbarang_controller.dart';

class DaftarbarangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarbarangController>(
      () => DaftarbarangController(),
    );
  }
}
