import 'package:fgo/constants.dart';
import 'package:fgo/routes/routes.dart';
import 'package:fgo/widgets/or_divider.dart';
import 'package:fgo/widgets/text_question_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectOtherRegister extends StatelessWidget {
  const SelectOtherRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        const SizedBox(
          height: 17,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: defaultPaddingBottom),
          child: TextQuestionSelect(
            question: "Đã có tài khoản? ",
            select: "Đăng nhập",
            press: () {
              Get.toNamed(RoutesClass.loginWithPhoneNumber);
            },
          ),
        )
      ],
    );
  }
}
