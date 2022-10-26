import 'package:fgo/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageTop extends StatelessWidget {
  const ImageTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          height: _sizeImage(),
          duration: const Duration(milliseconds: 400),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/image_login.png"),
                  fit: BoxFit.contain)),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: defaultPadding * 2, bottom: defaultPadding * 2),
          child:
              Text("Đăng nhập", style: Theme.of(context).textTheme.headline1),
        ),
      ],
    );
  }

  double _sizeImage() {
    double size = 0;
    if (Get.width < Get.height) {
      size = Get.width * 0.75;
    } else {
      size = Get.height * 0.75;
    }
    return size;
  }
}
