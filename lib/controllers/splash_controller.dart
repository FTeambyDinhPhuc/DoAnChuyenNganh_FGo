import 'package:fgo/constants.dart';
import 'package:fgo/methodshares/shared_preferences.dart';
import 'package:fgo/models/google_map_api_model.dart';
import 'package:fgo/routes/routes.dart';
import 'package:fgo/services/fgo_app_services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<bool> saveKeyGoogleMap(GoogleMapApiModel googleMap) async {
    await BaseSharedPreferences.setString('key_google_map', googleMap.apiKey);
    return true;
  }

  getGoogleMapAPIKey() async {
    GoogleMapApiModel? googleMapApi =
        await FGoAppServices.fetchGoogleMapAPIKey();
    if (googleMapApi != null) {
      BaseSharedPreferences.remove('key_google_map');
      saveKeyGoogleMap(googleMapApi);
      google_map_api_key =
          await BaseSharedPreferences.getString('key_google_map');
      checkLogin();
    } else {
      print("Dữ liệu tài khoản chưa được đổ vào!");
    }
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
}
