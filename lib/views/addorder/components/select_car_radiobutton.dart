import 'package:fgo/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCarRadioButton extends StatelessWidget {
  const SelectCarRadioButton(
      {Key? key,
      required this.dataSelected,
      required this.title,
      required this.valueButton})
      : super(key: key);

  final RxInt dataSelected;
  final String title;
  final int valueButton;

  @override
  Widget build(BuildContext context) {
    return Obx(() => RadioListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultCircular)),
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
          tileColor: dataSelected == valueButton
              ? Colors.teal.shade300
              : Colors.grey.shade300,
          value: valueButton,
          groupValue: dataSelected.value,
          onChanged: (Value) {
            dataSelected.value = int.parse(Value.toString());
          },
        ));
  }
}
