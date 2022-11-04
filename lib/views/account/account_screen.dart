import 'package:fgo/constants.dart';
import 'package:fgo/controllers/custommer_controller.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Thông tin tài khoản ',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
      body: Obx(() => _custommerController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
            )
          : Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AvatarTop(custommerController: _custommerController),
                    const SizedBox(height: defaultPadding * 2),
                    InfoAccount(custommerController: _custommerController),
                    const SizedBox(height: defaultPadding * 2),
                    ActionButton()
                  ],
                ),
              ),
            )),
    );
  }
}
