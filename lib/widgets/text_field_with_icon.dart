import 'package:fgo/constants.dart';
import 'package:flutter/material.dart';

class TextFieldWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextInputType inputType;
  final TextEditingController? controller;
  const TextFieldWithIcon(
      {Key? key,
      required this.text,
      required this.icon,
      this.controller,
      required this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          size: defaultSizeIcon,
        ),
        hintText: "$text",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultCircular),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultCircular),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
      keyboardType: inputType,
    );
  }
}
