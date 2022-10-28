import 'package:fgo/models/order_model.dart';
import 'package:fgo/views/booked/components/add_order_button.dart';
import 'package:fgo/views/booked/components/list_order.dart';
import 'package:flutter/material.dart';

class BookedScreen extends StatelessWidget {
  const BookedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Order dataTest = Order(
        idOrder: 1,
        scoresStart: 5.0,
        nameDriver: 'Nguyễn Khuyết Danh',
        imageDriver: 'assets/images/image_splash.png',
        status: 'Đang chạy');
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Lịch đặt xe',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListOrder(
            order: dataTest,
          ),
          AddOrderButton(),
        ],
      ),
    );
  }
}
