import 'package:fgo/constants.dart';
import 'package:fgo/controllers/custommer_controller.dart';
import 'package:fgo/controllers/home_controller.dart';
import 'package:fgo/routes/routes.dart';
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
    _custommerController.getCustommer(int.parse(_homeController.idCustommer));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: scaffoldBackgroundColor,
          padding: EdgeInsets.symmetric(
              vertical: defaultPadding, horizontal: defaultPaddingSmall),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Thông tin tài khoản',
                style: Theme.of(context).textTheme.headline2,
              ),
              Obx(() => _custommerController.isLoading.value
                  ? Container()
                  : IconButton(
                      onPressed: () {
                        Get.toNamed(RoutesClass.updateInfo);
                      },
                      icon: Icon(Icons.create)))
            ],
          ),
        ),
        Obx(() => _custommerController.isLoading.value
            ? Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
                ),
              )
            : Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      children: [
                        AvatarTop(custommerController: _custommerController),
                        const SizedBox(height: defaultPadding * 2),
                        InfoAccount(custommerController: _custommerController),
                        const SizedBox(height: defaultPadding * 2),
                        ActionButton(
                          homeController: _homeController,
                        )
                      ],
                    ),
                  ),
                ),
              )),
      ],
    );
  }
}
