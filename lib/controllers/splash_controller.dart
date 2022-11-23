import 'package:fgo/constants.dart';
import 'package:fgo/methodshares/shared_preferences.dart';
import 'package:fgo/models/google_map_api_model.dart';
import 'package:fgo/models/tainguyen_model.dart';
import 'package:fgo/routes/routes.dart';
import 'package:fgo/services/fgo_app_services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<bool> getGoogleMapAPIKey() async {
    bool ktLoadDuLieu = false;
    GoogleMapApiModel? googleMapApi =
        await FGoAppServices.fetchGoogleMapAPIKey();
    if (googleMapApi != null) {
      google_map_api_key = googleMapApi.apiKey;
      if (google_map_api_key != "") {
        ktLoadDuLieu = true;
      }
    } else {
      print("Dữ liệu google api key chưa được đổ vào!");
    }
    return ktLoadDuLieu;
  }

  Future<bool> getTaiNguyen() async {
    bool ktLoadDuLieu = false;
    TaiNguyenModel? taiNguyen = await FGoAppServices.fetchTaiNguyen();
    if (taiNguyen != null) {
      gasPrice = taiNguyen.giaxang;
      wage = taiNguyen.tiencong;
      if (gasPrice != 0 && wage != 0) {
        ktLoadDuLieu = true;
      }
    } else {
      print("Dữ liệu tài nguyên chưa được đổ vào!");
    }
    return ktLoadDuLieu;
  }

  checkLogin() async {
    String idKhachHang = await BaseSharedPreferences.getString('id_khachhang');
    String passKhachHang =
        await BaseSharedPreferences.getString('mk_khachhang');
    if (idKhachHang != '' && passKhachHang != '') {
      Get.offNamed(RoutesClass.home);
    } else {
      Get.offNamed(RoutesClass.login);
    }
  }

  getDataApp() async {
    bool ktGetGoogleAPIKey = await getGoogleMapAPIKey();
    bool ktGetTaiNguyen = await getTaiNguyen();
    if (ktGetGoogleAPIKey && ktGetTaiNguyen) {
      checkLogin();
    } else {
      getDataApp();
    }
  }
}
