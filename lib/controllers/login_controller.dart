import 'package:fgo/methodshares/shared_preferences.dart';
import 'package:fgo/models/custommer_model.dart';
import 'package:fgo/routes/routes.dart';
import 'package:fgo/services/fgoapp_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //texteditcontroller của text fiel
  late TextEditingController numberPhoneController; //text fiel số điện thoại
  late TextEditingController passwordController; //text fiel mật khẩu

  //Lưu id khách hàng sau khi đăng nhập thành công
  Future<bool> saveLogin(CustommerModel custommer) async {
    await BaseSharedPreferences.setString(
        'id_khachhang', custommer.idKhachhang.toString());
    return true;
  }

  //đăng nhập
  login() async {
    CustommerModel? custommer = await FGoAppServices.fetchLogin(
        numberPhoneController.text, passwordController.text);
    if (custommer != null) {
      await BaseSharedPreferences.remove('id_khachhang');
      saveLogin(custommer);
      Get.offAllNamed(RoutesClass.home);
    } else
      print("Dữ liệu tài khoản chưa được đổ vào!");
  }
}
