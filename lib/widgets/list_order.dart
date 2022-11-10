import 'package:fgo/models/order_model.dart';
import 'package:fgo/widgets/ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOrder extends StatelessWidget {
  ListOrder({
    Key? key,
    required RxList<OrderModel> list,
  })  : _list = list,
        super(key: key);

  RxList<OrderModel> _list;

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return Ticket(order: _list[index]);
        }));
  }
}
