import 'package:fgo/constants.dart';
import 'package:flutter/material.dart';

class LineInfoAccount extends StatelessWidget {
  LineInfoAccount({
    Key? key,
    required this.title,
    required this.infoAccount,
  }) : super(key: key);
  String title;
  String infoAccount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: defaultPadding / 3, bottom: defaultPadding / 2),
          child: Text(
            infoAccount,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        const Divider(
          thickness: defaultthickness,
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
