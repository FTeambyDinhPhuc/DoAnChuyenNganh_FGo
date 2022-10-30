import 'package:fgo/controllers/order_controller.dart';
import 'package:fgo/widgets/list_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  var _controller = Get.put(OrderController());
  @override
  void initState() {
    super.initState();
    _controller.getHistoryOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Lịch sử chuyến đi',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListOrder(
            controller: _controller,
          ),
        ],
      ),
    );
  }
}
