import 'package:fgo/constants.dart';
import 'package:fgo/controllers/order_controller.dart';
import 'package:fgo/controllers/place_search_controller.dart';
import 'package:fgo/views/addorder/components/title_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EstimatePart extends StatelessWidget {
  const EstimatePart(
      {Key? key,
      required PlaceSearchController placeSearchController,
      required OrderController orderController})
      : _placeSearchController = placeSearchController,
        _orderController = orderController,
        super(key: key);

  final PlaceSearchController _placeSearchController;
  final OrderController _orderController;

  @override
  Widget build(BuildContext context) {
    var moneyFormat = new NumberFormat("###,###,###");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Category(title: 'Ước tính'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Quãng đường', style: Theme.of(context).textTheme.headline6),
            Obx(() => Text('${_placeSearchController.distance} km',
                style: Theme.of(context).textTheme.headline5))
          ],
        ),
        const SizedBox(height: defaultPadding / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Thành Tiền', style: Theme.of(context).textTheme.headline6),
            Obx(() => Text(
                '${moneyFormat.format(_orderController.totalMoney.value)} vnđ',
                style: Theme.of(context).textTheme.headline5))
          ],
        ),
      ],
    );
  }
}
