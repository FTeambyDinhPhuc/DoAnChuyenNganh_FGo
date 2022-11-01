import 'package:fgo/constants.dart';
import 'package:fgo/routes/routes.dart';
import 'package:fgo/widgets/text_question_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/button_login.dart';
import 'components/image_top.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                bottom: defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImageTop(),
                ButtonLogin(),
                const SizedBox(height: defaultPadding),
                TextQuestionSelect(
                  question: "Chưa có tài khoản? ",
                  select: "Đăng ký",
                  press: () {
                    Get.toNamed(RoutesClass.register);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
