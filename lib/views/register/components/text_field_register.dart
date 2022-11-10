import 'package:fgo/constants.dart';

import 'package:fgo/controllers/register_controller.dart';
import 'package:fgo/widgets/pass_text_field_with_icon.dart';
import 'package:fgo/widgets/text_field_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldRegister extends StatelessWidget {
  const TextFieldRegister(
      {Key? key, required RegisterController registercontroller})
      : _registerController = registercontroller,
        super(key: key);

  final RegisterController _registerController;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        "Đăng ký",
        style: Theme.of(context).textTheme.headline1,
      ),
      Padding(
        padding: const EdgeInsets.only(
            top: defaultPadding * 2.5, bottom: defaultPadding * 1.5),
        child: Column(children: [
          TextFieldWithIcon(
            controller: _registerController.sodienthoaiController,
            text: "Số điện thoại",
            icon: FontAwesomeIcons.phone,
            inputType: TextInputType.phone,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldWithIcon(
            controller: _registerController.tenhienthiController,
            text: "Tên hiển thị",
            icon: FontAwesomeIcons.userTie,
            inputType: TextInputType.name,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldWithIcon(
            controller: _registerController.cccdController,
            text: "Căn cước công dân",
            icon: FontAwesomeIcons.idCard,
            inputType: TextInputType.number,
          ),
          const SizedBox(height: defaultPadding),
          PassTextFieldWithIcon(
            controller: _registerController.matkhauController,
            text: "Mật khẩu",
            icon: FontAwesomeIcons.lock,
            inputType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldWithIcon(
            controller: _registerController.xacnhanmatkhauController,
            text: "Xác nhận mật khẩu",
            icon: FontAwesomeIcons.lock,
            inputType: TextInputType.visiblePassword,
          ),
        ]),
      ),
    ]);
  }
}
