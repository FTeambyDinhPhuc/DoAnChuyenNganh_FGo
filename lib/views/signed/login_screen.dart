import 'package:fgo/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                _imageTop(context),
                _buttonLogin(context),
                _dontHaveAccount(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _dontHaveAccount(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bạn chưa có tài khoản ? ",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Đăng ký",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Column _imageTop(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/images/image_login.png",
              width: _sizeImage(),
            )),
        Padding(
          padding: const EdgeInsets.only(
              top: defaultPadding * 2, bottom: defaultPadding * 2),
          child:
              Text("Đăng nhập", style: Theme.of(context).textTheme.headline1),
        ),
      ],
    );
  }

  Column _buttonLogin(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          height: 55,
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
          onPressed: () {},
        ),
        Row(
          children: [
            _buildDivider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "OR",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _buildDivider(),
          ],
        ),
        MaterialButton(
          height: 55,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.facebook,
                color: Colors.white,
              ),
              const SizedBox(width: defaultPadding),
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
      ],
    );
  }
}

double _sizeImage() {
  double size = 0;
  if (Get.width < Get.height) {
    size = Get.width * 0.8;
  } else {
    size = Get.height * 0.8;
  }
  return size;
}

Expanded _buildDivider() {
  return const Expanded(
    child: Divider(
      color: Colors.black,
      height: 50,
    ),
  );
}
