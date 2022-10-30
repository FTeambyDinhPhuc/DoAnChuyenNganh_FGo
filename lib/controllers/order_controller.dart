import 'package:fgo/constants.dart';
import 'package:fgo/models/order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var orderList = <Order>[].obs;

  void getAllOrder() {
    orderList.value = [
      Order(
          idOrder: 0,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 0',
          imageDriver: 'assets/images/image_splash.png',
          status: statusBooked),
      Order(
          idOrder: 1,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 1',
          imageDriver: 'assets/images/image_splash.png',
          status: statusStarting),
      Order(
          idOrder: 2,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 2',
          imageDriver: 'assets/images/image_splash.png',
          status: statusCompleted),
      Order(
          idOrder: 3,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 3',
          imageDriver: 'assets/images/image_splash.png',
          status: statusCancelled),
    ];
  }

  void getBookedOrder() {
    orderList.value = [
      Order(
          idOrder: 4,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 4',
          imageDriver: 'assets/images/image_splash.png',
          status: statusBooked),
      Order(
          idOrder: 5,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 5',
          imageDriver: 'assets/images/image_splash.png',
          status: statusBooked),
      Order(
          idOrder: 6,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 6',
          imageDriver: 'assets/images/image_splash.png',
          status: statusBooked),
    ];
  }

  void getStartingOrder() {
    orderList.value = [
      Order(
          idOrder: 7,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 7',
          imageDriver: 'assets/images/image_splash.png',
          status: statusStarting),
    ];
  }

  void getHistoryOrder() {
    orderList.value = [
      Order(
          idOrder: 8,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 8',
          imageDriver: 'assets/images/image_splash.png',
          status: statusCompleted),
      Order(
          idOrder: 9,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 9',
          imageDriver: 'assets/images/image_splash.png',
          status: statusCancelled),
    ];
  }
}
