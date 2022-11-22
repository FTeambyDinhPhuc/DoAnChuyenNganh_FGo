import 'package:fgo/constants.dart';
import 'package:fgo/controllers/custommer_controller.dart';
import 'package:fgo/controllers/home_controller.dart';
import 'package:fgo/views/changeimage/components/image_change.dart';
import 'package:fgo/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeImageScreen extends StatefulWidget {
  const ChangeImageScreen({super.key});

  @override
  State<ChangeImageScreen> createState() => _ChangeImageScreenState();
}

class _ChangeImageScreenState extends State<ChangeImageScreen> {
  var _custommerController = Get.find<CustommerController>();
  var _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: Text(
            'Đổi hình đại diện',
            style: Theme.of(context).textTheme.headline2,
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding, horizontal: defaultPadding),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: Get.height / 1.5,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: defaultPaddingSmall,
                      mainAxisSpacing: defaultPaddingSmall),
                  children: [
                    ImageChange(
                        hinh: 'https://i.imgur.com/L6Gtunk.jpg',
                        custommerController: _custommerController,
                        homeController: _homeController),
                    ImageChange(
                        hinh: 'https://i.imgur.com/SAWOgyP.jpg',
                        custommerController: _custommerController,
                        homeController: _homeController),
                  ],
                ),
              ),
              ButtonFullWidth(
                  text: "Hủy",
                  color: Colors.red.shade300,
                  press: () {
                    Get.back();
                  }),
            ]),
      ),
    );
  }
}
