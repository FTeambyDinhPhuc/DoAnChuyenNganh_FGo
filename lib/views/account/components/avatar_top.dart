import 'package:fgo/constants.dart';
import 'package:fgo/controllers/custommer_controller.dart';
import 'package:flutter/material.dart';

class AvatarTop extends StatelessWidget {
  const AvatarTop({
    Key? key,
    required CustommerController custommerController,
  })  : _custommerController = custommerController,
        super(key: key);

  final CustommerController _custommerController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: CircleAvatar(
            backgroundImage: AssetImage(_custommerController.custommer!.hinh),
            radius: defaultSizeImage,
          ),
        ),
        GestureDetector(
          onTap: () {
            _custommerController.setImage();
          },
          child: Text(
            "Đổi ảnh đại diện",
            style: Theme.of(context).textTheme.headline6,
          ),
        )
      ],
    );
  }
}
