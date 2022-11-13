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
      await BaseSharedPreferences.remove('key_google_map');
      await saveKeyGoogleMap(googleMapApi);
      google_map_api_key =
          await BaseSharedPreferences.getString('key_google_map');
      Get.offNamed(RoutesClass.login);
    } else {
      print("Dữ liệu tài khoản chưa được đổ vào!");
    }
  }
}
