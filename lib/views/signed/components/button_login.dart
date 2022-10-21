import 'package:fgo/constants.dart';
import 'package:fgo/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'or_divider.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          height: heightButton,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                FontAwesomeIcons.facebook,
                color: Colors.white,
              ),
              Text(
                "Đăng nhập bằng Facebook",
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          onPressed: () {},
        ),
        const SizedBox(height: defaultPadding),
        MaterialButton(
          height: heightButton,
          color: Colors.orange.shade800,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                FontAwesomeIcons.google,
                color: Colors.white,
              ),
              Text(
                "Đăng nhập bằng Google",
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          onPressed: () {},
        ),
        OrDivider(),
        MaterialButton(
          height: heightButton,
          color: Theme.of(context).primaryColor,
          child: Text(
            "Đăng nhập bằng số điện thoại",
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(color: Colors.white),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          onPressed: () {
            Get.toNamed(RoutesClass.loginWithPhoneNumber);
          },
        ),
      ],
    );
  }
}
