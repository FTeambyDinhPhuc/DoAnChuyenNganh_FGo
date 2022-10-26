import 'package:fgo/constants.dart';
import 'package:flutter/material.dart';

class ButtonFullWidth extends StatelessWidget {
  final String text;
  final Function press;
  const ButtonFullWidth({Key? key, required this.text, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: heightButton,
      color: Theme.of(context).primaryColor,
      child: Text(
        "$text",
        style: Theme.of(context).textTheme.button,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultCircular)),
      onPressed: press as void Function(),
    );
  }
}
