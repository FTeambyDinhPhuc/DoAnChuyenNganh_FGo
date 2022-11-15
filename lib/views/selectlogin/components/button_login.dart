import 'package:fgo/constants.dart';
import 'package:fgo/routes/routes.dart';
import 'package:fgo/widgets/button_full_width.dart';
import 'package:fgo/widgets/or_divider.dart';
import 'package:fgo/widgets/text_question_select.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: defaultPaddingLarge),
            child: ButtonFullWidth(
              text: "Đăng nhập bằng số điện thoại",
              press: () {
                Get.toNamed(RoutesClass.loginWithPhoneNumber);
              },
            ),
          ),
          Column(
            children: [
              OrDivider(),
              const SizedBox(
                height: 17,
              ),
              TextQuestionSelect(
                question: "Chưa có tài khoản? ",
                select: "Đăng ký",
                press: () {
                  Get.toNamed(RoutesClass.register);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
