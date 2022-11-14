import 'package:fgo/constants.dart';
import 'package:fgo/models/order_model.dart';
import 'package:flutter/material.dart';

Color ColorTicket(OrderModel order) {
  if (order.trangthai == statusStarting ||
      order.trangthai == statusToPickUpPoint ||
      order.trangthai == statusStartTheTrip)
    return Colors.teal.shade300;
  else if (order.trangthai == statusCompleted)
    return Colors.blue.shade300;
  else if (order.trangthai == statusBooked)
    return Colors.lightGreen.shade300;
  else if (order.trangthai == statusWaitForConfirmation)
    return Colors.blueGrey.shade300;

  return Colors.red.shade300;
}
