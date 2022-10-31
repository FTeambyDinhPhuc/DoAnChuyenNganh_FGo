import 'package:fgo/constants.dart';
import 'package:fgo/controllers/order_controller.dart';
import 'package:fgo/views/addorder/components/title_category.dart';
import 'package:flutter/material.dart';

class DateTimePart extends StatelessWidget {
  const DateTimePart({
    Key? key,
    required OrderController orderController,
  })  : _orderController = orderController,
        super(key: key);

  final OrderController _orderController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Category(title: 'Thời gian'),
        TextField(
          controller: _orderController.bookingDateController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.calendar_today_outlined),
            hintText: 'Ngày đón',
          ),
          readOnly: true,
          onTap: () {
            _orderController.getBookingDate(context);
          },
        ),
        const SizedBox(height: defaultPadding / 2),
        TextField(
          controller: _orderController.bookingTimeController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.access_time_outlined),
            hintText: 'Giờ đón',
          ),
          readOnly: true,
          onTap: () {
            _orderController.getBookingTime(context);
          },
        ),
      ],
    );
  }
}
