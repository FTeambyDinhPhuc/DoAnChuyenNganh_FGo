import 'package:fgo/routes/routes.dart';

import 'package:get/get.dart';
import 'package:fgo/methodshares/shared_preferences.dart';

class HomeController extends GetxController {
  String idCustommer = '';
  String passCustommer = '';
  var disposeHome = true.obs;

  getIdCustommer() async {
    idCustommer = await BaseSharedPreferences.getString('id_khachhang');
    passCustommer = await BaseSharedPreferences.getString('mk_khachhang');
    if (idCustommer != '' && passCustommer != '') {
      disposeHome.value = false;
    }
  }

  logout() async {
    await BaseSharedPreferences.remove('id_khachhang');
    await BaseSharedPreferences.remove('mk_khachhang');
    Get.offAllNamed(RoutesClass.splash);
  }
}
