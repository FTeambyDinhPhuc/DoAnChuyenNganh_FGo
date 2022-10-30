import 'package:fgo/constants.dart';
import 'package:fgo/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOrderButton extends StatelessWidget {
  const AddOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(RoutesClass.addOrder);
          },
          child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add_rounded,
              size: defaultSizeIconButton,
            ),
          ),
        ),
      ),
    );
  }
}
