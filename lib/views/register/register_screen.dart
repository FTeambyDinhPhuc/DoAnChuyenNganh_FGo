import 'package:fgo/constants.dart';
import 'package:fgo/routes/routes.dart';
import 'package:fgo/views/register/components/select_orther_register.dart';

import 'package:fgo/views/register/components/text_field_register.dart';
import 'package:fgo/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  const Register({super.key});
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
                TextFieldRegister(),
                ButtonFullWidth(
                    text: "Đăng ký",
                    press: () {
                      Get.offNamed(RoutesClass.loginWithPhoneNumber);
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
