import 'package:fgo/routes/routes.dart';

import 'package:get/get.dart';
import 'package:fgo/methodshares/shared_preferences.dart';

class HomeController extends GetxController {
  var idCustommer = ''.obs;
  var passCustommer = ''.obs;

  getIdCustommer() async {
    idCustommer.value = await BaseSharedPreferences.getString('id_khachhang');
    passCustommer.value = await BaseSharedPreferences.getString('mk_khachhang');
  }

  logout() async {
    await BaseSharedPreferences.remove('id_khachhang');
    await BaseSharedPreferences.remove('mk_khachhang');
    Get.offAllNamed(RoutesClass.splash);
  }
}
