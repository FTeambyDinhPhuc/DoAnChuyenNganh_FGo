import 'package:fgo/controllers/custommer_controller.dart';
import 'package:fgo/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class ImageChange extends StatelessWidget {
  const ImageChange({
    Key? key,
    required String hinh,
    required CustommerController custommerController,
    required HomeController homeController,
  })  : _hinh = hinh,
        _custommerController = custommerController,
        _homeController = homeController,
        super(key: key);

  final CustommerController _custommerController;
  final HomeController _homeController;
  final String _hinh;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _custommerController.updateImage(_homeController.idCustommer, _hinh);
      },
      child: Container(
        child: Image.network(_hinh),
      ),
    );
  }
}
