import 'package:fgo/constants.dart';
import 'package:fgo/controllers/custommer_controller.dart';
import 'package:fgo/controllers/home_controller.dart';
import 'package:fgo/views/changepassword/components/text_field_change_password.dart';
import 'package:fgo/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var _custommerController = Get.find<CustommerController>();
  var _homeController = Get.find<HomeController>();

  @override
  void initState() {
    _custommerController.getTextEditControllerChangePass();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFiledChangePassword(
                    custommerController: _custommerController),
                ButtonFullWidth(
                    text: "Xác nhận",
                    press: () {
                      _custommerController.updatePass(
                          _homeController.idCustommer,
                          context,
                          _homeController);
                    }),
                const SizedBox(height: defaultPadding),
                ButtonFullWidth(
                    text: "Hủy",
                    color: Colors.red.shade300,
                    press: () {
                      Get.back();
                    }),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
