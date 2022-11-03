import 'package:fgo/controllers/location_controller.dart';
import 'package:fgo/controllers/order_controller.dart';
import 'package:get/get.dart';

class NowBingding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController());
    Get.lazyPut<LocationController>(() => LocationController());
  }
}
