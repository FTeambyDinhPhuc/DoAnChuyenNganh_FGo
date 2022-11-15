import 'package:fgo/constants.dart';
import 'package:fgo/routes/routes.dart';
import 'package:fgo/widgets/button_icon_small.dart';
import 'package:fgo/widgets/or_divider.dart';
import 'package:fgo/widgets/text_question_select.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SelectOtherLoginWithNumberphone extends StatelessWidget {
  const SelectOtherLoginWithNumberphone({
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
          padding: const EdgeInsets.only(
            bottom: defaultPaddingBottom,
          ),
          child: TextQuestionSelect(
            question: "Chưa có tài khoản? ",
            select: "Đăng ký",
            press: () {
              Get.toNamed(RoutesClass.register);
            },
          ),
        )
      ],
    );
  }
}
