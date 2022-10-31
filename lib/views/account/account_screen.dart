import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Thông tin tài khoản',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
