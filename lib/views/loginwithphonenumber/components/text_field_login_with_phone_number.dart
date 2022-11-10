import 'package:fgo/constants.dart';
import 'package:fgo/controllers/login_controller.dart';
import 'package:fgo/widgets/pass_text_field_with_icon.dart';
import 'package:fgo/widgets/text_field_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldLoginWithPhoneNumber extends StatelessWidget {
  const TextFieldLoginWithPhoneNumber({
    Key? key,
    required LoginController loginController,
  })  : _loginController = loginController,
        super(key: key);

  final LoginController _loginController;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Đăng nhập\nBằng số điện thoại",
            style: Theme.of(context).textTheme.headline1,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: defaultPadding * 2.5, bottom: defaultPadding * 1.5),
            child: Column(children: [
              TextFieldWithIcon(
                controller: _loginController.numberPhoneController,
                text: "Số điện thoại",
                icon: FontAwesomeIcons.phone,
                inputType: TextInputType.phone,
              ),
              const SizedBox(height: defaultPadding),
              PassTextFieldWithIcon(
                controller: _loginController.passwordController,
                text: "Mật khẩu",
                icon: FontAwesomeIcons.lock,
                inputType: TextInputType.visiblePassword,
              )
            ]),
          ),
        ]);
  }
}
