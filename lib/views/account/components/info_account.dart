import 'package:fgo/controllers/custommer_controller.dart';
import 'package:fgo/views/account/components/line_info_account.dart';
import 'package:flutter/material.dart';

class InfoAccount extends StatelessWidget {
  const InfoAccount({
    Key? key,
    required CustommerController custommerController,
  })  : _custommerController = custommerController,
        super(key: key);

  final CustommerController _custommerController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // LineInfoAccount(
        //     title: 'Tên khách hàng',
        //     infoAccount: _custommerController.custommer.tenkhachhang),
        // LineInfoAccount(
        //     title: 'Số điện thoại',
        //     infoAccount: _custommerController.custommer!.sodienthoai),
      ],
    );
  }
}
