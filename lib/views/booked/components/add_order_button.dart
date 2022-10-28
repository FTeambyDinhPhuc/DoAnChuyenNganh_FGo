import 'package:fgo/constants.dart';
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

class _AddOrderPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: (() {
            Get.back();
          }),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          Center(
            child: Text(
              'Đặt xe',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          const SizedBox(width: defaultPadding),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
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
