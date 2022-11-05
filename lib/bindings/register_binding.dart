import 'package:fgo/controllers/custommer_controller.dart';

import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustommerController>(() => CustommerController());
  }
}
