import 'package:fgo/constants.dart';
import 'package:fgo/models/order_model.dart';
import 'package:flutter/material.dart';

Color ColorTicket(OrderModel order) {
  if (order.trangthai == statusCancelled) {
    return Colors.red;
  } else if (order.trangthai == statusWaitForConfirmation) {
    return Colors.grey;
  }
  return primaryColor;
}
