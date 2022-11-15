import 'package:fgo/constants.dart';
import 'package:flutter/material.dart';

class InfoOrder extends StatelessWidget {
  const InfoOrder({
    Key? key,
    required this.titleInfo,
    required this.describe,
  }) : super(key: key);

  final String titleInfo;
  final String describe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleInfo,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          describe,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const Divider(
          thickness: defaultthickness,
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
