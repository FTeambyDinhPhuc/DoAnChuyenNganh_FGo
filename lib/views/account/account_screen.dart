import 'package:fgo/constants.dart';
import 'package:fgo/controllers/custommer_controller.dart';
import 'package:fgo/controllers/home_controller.dart';
import 'package:fgo/views/account/components/action_button.dart';
import 'package:fgo/views/account/components/avatar_top.dart';
import 'package:fgo/views/account/components/info_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var _custommerController = Get.put(CustommerController());
  var _homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    _custommerController
        .getCustommer(int.parse(_homeController.idCustommer.value));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _custommerController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
            )
          : Column(
              children: [
                Container(
                  width: Get.width,
                  color: scaffoldBackgroundColor,
                  padding: EdgeInsets.fromLTRB(
                      defaultPaddingSmall, defaultPadding, 0, defaultPadding),
                  child: Text(
                    'Thông tin tài khoản',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(defaultPadding),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AvatarTop(custommerController: _custommerController),
                          const SizedBox(height: defaultPadding * 2),
                          InfoAccount(
                              custommerController: _custommerController),
                          const SizedBox(height: defaultPadding * 2),
                          ActionButton(
                            custommerController: _custommerController,
                            homeController: _homeController,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
