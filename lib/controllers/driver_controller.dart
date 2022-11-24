import 'package:fgo/models/driver_model.dart';
import 'package:fgo/services/fgo_app_services.dart';
import 'package:get/get.dart';

class DriverController extends GetxController {
  //Lấy thông tin tài khoản tài xế
  Future<DriverModel?> getDriver(int id) async {
    DriverModel? driver = await FGoAppServices.fetchDriver(id);
    if (driver != null) {
      return driver;
    } else
      print("Dữ liệu tài khoản chưa được đổ vào!");
    return null;
  }
}
