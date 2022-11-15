import 'package:fgo/constants.dart';
import 'package:fgo/controllers/register_controller.dart';
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
  var _registerController = Get.find<RegisterController>();

  @override
  void initState() {
    _registerController.sodienthoaiController = TextEditingController();
    _registerController.tenhienthiController = TextEditingController();
    _registerController.cccdController = TextEditingController();
    _registerController.matkhauController = TextEditingController();
    _registerController.xacnhanmatkhauController = TextEditingController();
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFieldRegister(registercontroller: _registerController),
                ButtonFullWidth(
                    text: "Đăng ký",
                    press: () {
                      _registerController.register();
                    }),
                Padding(
                  padding: const EdgeInsets.only(
                    top: defaultPaddingLarge,
                  ),
                  child: SelectOtherRegister(),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
