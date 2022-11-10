import 'package:fgo/constants.dart';
import 'package:fgo/models/google_map_api_model.dart';
import 'package:fgo/routes/routes.dart';
import 'package:fgo/services/fgoapp_services.dart';
import 'package:get/get.dart';
import 'package:fgo/methodshares/shared_preferences.dart';

class HomeController extends GetxController {
  var idCustommer = ''.obs;

  getIdCustommer() async {
    idCustommer.value = await BaseSharedPreferences.getString('id_khachhang');
  }

  logout() async {
    await BaseSharedPreferences.remove('id_khachhang');
    Get.offAllNamed(RoutesClass.splash);
  }

  getGoogleMapAPIKey() async {
    GoogleMapApiModel? googleMapApi =
        await FGoAppServices.fetchGoogleMapAPIKey();
    google_map_api_key = googleMapApi!.apiKey;
  }
}
