import 'package:fgo/constants.dart';
import 'package:fgo/routes/routes.dart';
import 'package:fgo/services/fgo_app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController sodienthoaiController;
  late TextEditingController tenhienthiController;
  late TextEditingController cccdController;
  late TextEditingController matkhauController;
  late TextEditingController xacnhanmatkhauController;

  //Đăng ký tài khoản
  register() async {
    if (matkhauController.text == xacnhanmatkhauController.text) {
      bool? registerError = await FGoAppServices.fetchRegister(
          sodienthoaiController.text,
          tenhienthiController.text,
          cccdController.text,
          matkhauController.text);
      if (!registerError!) {
        Get.offNamed(RoutesClass.loginWithPhoneNumber);
        Get.snackbar(titleSnackbarAccount, 'Đăng ký thành công ');
      } else
        print("Đăng ký lỗi!");
    } else {
      Get.snackbar(titleSnackbarAccount, 'Mật khẩu xác nhận không giống!');
    }
  }
}
