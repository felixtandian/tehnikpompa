import 'package:get/get.dart';

import '../controllers/createservice_controller.dart';

class CreateserviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateserviceController>(
      () => CreateserviceController(),
    );
  }
}
