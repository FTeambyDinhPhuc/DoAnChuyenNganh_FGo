import 'package:fgo/controllers/order_controller.dart';

import 'package:fgo/views/booked/components/add_order_button.dart';
import 'package:fgo/widgets/list_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookedScreen extends StatefulWidget {
  const BookedScreen({super.key});

  @override
  State<BookedScreen> createState() => _BookedScreenState();
}

class _BookedScreenState extends State<BookedScreen> {
  var _controller = Get.put(OrderController());
  @override
  void initState() {
    super.initState();
    _controller.getBookedOrder();
  }

  @override
  Widget build(BuildContext context) {
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
            controller: _controller,
          ),
          AddOrderButton(),
        ],
      ),
    );
  }
}
