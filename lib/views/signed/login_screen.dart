import 'package:fgo/constants.dart';
import 'package:flutter/material.dart';
import 'components/button_login.dart';
import 'components/image_top.dart';
import 'components/text_question_select.dart';

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
              children: [
                ImageTop(),
                ButtonLogin(),
                const SizedBox(height: defaultPadding),
                TextQuestionSelect(
                  question: "Chưa có tài khoản? ",
                  select: "Đăng ký",
                  press: () {
                    print("hihi");
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
