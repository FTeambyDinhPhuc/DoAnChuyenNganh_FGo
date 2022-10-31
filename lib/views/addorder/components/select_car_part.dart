import 'package:fgo/constants.dart';
import 'package:fgo/views/addorder/components/select_car_radiobutton.dart';
import 'package:fgo/views/addorder/components/title_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCarPart extends StatelessWidget {
  const SelectCarPart({
    Key? key,
    required this.dataSelected,
  }) : super(key: key);

  final RxInt dataSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Category(title: 'Loại xe'),
        SelectCarRadioButton(
          dataSelected: dataSelected,
          title: 'Xe 5 chổ',
          valueButton: 5,
        ),
        const SizedBox(height: defaultPadding / 2),
        SelectCarRadioButton(
          dataSelected: dataSelected,
          title: 'Xe 7 chổ',
          valueButton: 7,
        ),
        const SizedBox(height: defaultPadding / 2),
        SelectCarRadioButton(
          dataSelected: dataSelected,
          title: 'Xe 16 chổ',
          valueButton: 16,
        ),
      ],
    );
  }
}
