import 'package:fgo/constants.dart';
import 'package:fgo/widgets/button_icon_small.dart';
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
            Get.to(_AddOrderPopup());
          },
          child: Hero(
            tag: 'addOrder',
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
      ),
    );
  }
}

class _AddOrderPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'addOrder',
      child: Container(
        padding:
            EdgeInsets.only(top: defaultPadding * 3, right: defaultPaddingIcon),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(defaultCircular)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonIconSmall(
                  icon: Icons.arrow_back_ios,
                  press: () {
                    Get.back();
                  },
                ),
                Text(
                  "Đặt xe",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(children: []),
            ),
          ],
        ),
      ),
    );
  }
}
