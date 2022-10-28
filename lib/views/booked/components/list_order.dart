import 'package:fgo/models/order_model.dart';
import 'package:fgo/widgets/ticket.dart';
import 'package:flutter/material.dart';

class ListOrder extends StatelessWidget {
  const ListOrder({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 13,
        itemBuilder: (BuildContext context, int index) {
          return Ticket(order: order);
        });
  }
}
