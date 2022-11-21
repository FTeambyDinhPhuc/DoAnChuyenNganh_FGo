import 'package:fgo/constants.dart';
import 'package:flutter/material.dart';
import 'components/button_login.dart';
import 'components/image_top.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: defaultPadding,
              right: defaultPadding,
              bottom: defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageTop(),
                ButtonLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
