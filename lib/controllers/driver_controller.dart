import 'package:fgo/models/driver_model.dart';
import 'package:fgo/services/fgoapp_services.dart';
import 'package:get/get.dart';

class DriverController extends GetxController {
  var isLoading = true.obs;
  DriverModel? driver;

  //Lấy thông tin tài khoản tài xế
  getDriver(int id) async {
    driver = await FGoAppServices.fetchDriver(id);
    if (driver != null) {
      isLoading.value = false;
    } else
      print("Dữ liệu tài khoản chưa được đổ vào!");
  }
}
