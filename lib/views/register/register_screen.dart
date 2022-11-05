import 'package:fgo/constants.dart';
import 'package:fgo/controllers/custommer_controller.dart';
import 'package:fgo/routes/routes.dart';
import 'package:fgo/views/register/components/select_orther_register.dart';

import 'package:fgo/views/register/components/text_field_register.dart';
import 'package:fgo/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _custommerController = Get.find<CustommerController>();

  @override
  void initState() {
    _custommerController.sodienthoaiController = TextEditingController();
    _custommerController.tenhienthiController = TextEditingController();
    _custommerController.cccdController = TextEditingController();
    _custommerController.matkhauController = TextEditingController();
    _custommerController.xacnhanmatkhauController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 19, top: 0, right: 19, bottom: 0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldRegister(custommerController: _custommerController),
                ButtonFullWidth(
                    text: "Đăng ký",
                    press: () {
                      Get.offNamed(RoutesClass.loginWithPhoneNumber);
                      Get.snackbar(titleSnackbarAccount, 'Đăng ký thành công ');
                    }),
                const SizedBox(height: defaultPadding * 2),
                SelectOtherRegister()
              ],
            ),
          ),
        ),
      )),
    );
  }
}
