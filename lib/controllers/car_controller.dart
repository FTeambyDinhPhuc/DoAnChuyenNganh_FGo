import 'package:fgo/models/car_model.dart';

import 'package:fgo/services/fgo_app_services.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  var isLoading = true.obs;
  RxList<CarModel>? carList;

  //Lấy thông tin tài khoản tài xế
  getCar(int id) async {
    var list = await FGoAppServices.fetchCar(id);
    if (list != null) {
      carList = list.obs;
      isLoading.value = false;
    }
  }
}
