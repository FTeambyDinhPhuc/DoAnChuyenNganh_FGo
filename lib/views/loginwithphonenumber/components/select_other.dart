import 'package:fgo/constants.dart';
import 'package:fgo/widgets/button_icon_small.dart';
import 'package:fgo/widgets/or_divider.dart';
import 'package:fgo/widgets/text_question_select.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectOther extends StatelessWidget {
  const SelectOther({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Padding(
          padding: const EdgeInsets.all(21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonIconSmall(
                icon: FontAwesomeIcons.google,
                colorIcon: Colors.white,
                colorBackground: Colors.orange.shade800,
                press: () {},
              ),
              ButtonIconSmall(
                icon: FontAwesomeIcons.facebook,
                colorIcon: Colors.white,
                colorBackground: Colors.blue,
                press: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: defaultPaddingBottom),
          child: TextQuestionSelect(
            question: "Chưa có tài khoản? ",
            select: "Đăng ký",
            press: () {},
          ),
        )
      ],
    );
  }
}
