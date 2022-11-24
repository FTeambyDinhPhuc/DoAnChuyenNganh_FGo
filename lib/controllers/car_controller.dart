import 'package:fgo/models/car_model.dart';

import 'package:fgo/services/fgo_app_services.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  //Lấy thông tin tài khoản xe theo id tài xế
  Future<List<CarModel>?> getCar(int id) async {
    List<CarModel>? list = await FGoAppServices.fetchCar(id);
    if (list != null) {
      return list;
    } else {
      return null;
    }
  }
}
