import 'package:fgo/constants.dart';
import 'package:fgo/views/addorder/components/title_category.dart';
import 'package:flutter/material.dart';

class EstimatePart extends StatelessWidget {
  const EstimatePart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Category(title: 'Ước tính'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Quãng đường', style: Theme.of(context).textTheme.headline6),
            Text('300 km', style: Theme.of(context).textTheme.headline5)
          ],
        ),
        const SizedBox(height: defaultPadding / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Thành Tiền', style: Theme.of(context).textTheme.headline6),
            Text('30.000 vnđ', style: Theme.of(context).textTheme.headline5)
          ],
        ),
      ],
    );
  }
}
