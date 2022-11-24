import 'package:fgo/constants.dart';
import 'package:fgo/controllers/custommer_controller.dart';
import 'package:fgo/controllers/home_controller.dart';
import 'package:fgo/views/updateinfo/components/text_field_change_info.dart';
import 'package:fgo/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateInfoScreen extends StatefulWidget {
  const UpdateInfoScreen({super.key});

  @override
  State<UpdateInfoScreen> createState() => _UpdateInfoScreenState();
}

class _UpdateInfoScreenState extends State<UpdateInfoScreen> {
  var _custommerController = Get.find<CustommerController>();
  var _homeController = Get.find<HomeController>();

  @override
  void initState() {
    _custommerController.getTextEditControllerChangeInfo();
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
                TextFiledChangeInfo(custommerController: _custommerController),
                ButtonFullWidth(
                    text: "Xác nhận",
                    press: () {
                      _custommerController.updateInfo(
                        _homeController.idCustommer,
                        context,
                      );
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
