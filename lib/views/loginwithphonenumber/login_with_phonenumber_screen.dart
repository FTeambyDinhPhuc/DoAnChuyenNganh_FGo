import 'package:fgo/routes/routes.dart';
import 'package:fgo/views/loginwithphonenumber/components/select_other.dart';
import 'package:fgo/views/loginwithphonenumber/components/text_field_login_with_phone_number.dart';
import 'package:fgo/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWithPhoneNumber extends StatelessWidget {
  const LoginWithPhoneNumber({super.key});
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
                    child: TextFieldLoginWithPhoneNumber(),
                  ),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonFullWidth(
                              text: "Đăng nhập",
                              press: () {
                                Get.offAllNamed(RoutesClass.home);
                              }),
                          SelectOther()
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
