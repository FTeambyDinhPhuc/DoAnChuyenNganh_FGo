import 'package:fgo/controllers/login_controller.dart';
import 'package:fgo/views/loginwithphonenumber/components/select_other_login_with_numberphone.dart';
import 'package:fgo/views/loginwithphonenumber/components/text_field_login_with_phone_number.dart';
import 'package:fgo/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  var _loginController = Get.find<LoginController>();

  @override
  void initState() {
    _loginController.numberPhoneController = TextEditingController();
    _loginController.passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 19, top: 0, right: 19, bottom: 0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Expanded(
                    child: TextFieldLoginWithPhoneNumber(
                        loginController: _loginController),
                  ),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonFullWidth(
                              text: "Đăng nhập",
                              press: () {
                                _loginController.login();
                              }),
                          SelectOtherLoginWithNumberphone()
                        ]),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
