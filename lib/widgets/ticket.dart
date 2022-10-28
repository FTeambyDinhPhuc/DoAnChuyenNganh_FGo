import 'package:fgo/constants.dart';
import 'package:fgo/models/order_model.dart';
import 'package:fgo/widgets/button_icon_small.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Ticket extends StatelessWidget {
  const Ticket({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(_TicketPopup(order: order));
      },
      child: Hero(
          tag: order.idOrder,
          child: Container(
            height: 100,
            margin: EdgeInsets.all(defaultPadding),
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(defaultCircular),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 5.0,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-1.0, -1.0),
                  blurRadius: 5.0,
                )
              ],
            ),
            child: _InfoBase(
              order: order,
            ),
          )),
    );
  }
}

class _InfoBase extends StatelessWidget {
  const _InfoBase({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            order.imageDriver,
            height: 50,
            width: 50,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.nameDriver,
              style: Theme.of(context).textTheme.headline5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  FontAwesomeIcons.solidStar,
                  size: defaultSizeIcon,
                  color: Colors.yellow,
                ),
                const SizedBox(width: defaultPadding * 0.5),
                Text(
                  "${order.scoresStart}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(width: defaultPadding),
                Text(
                  "Mã đơn: ${order.idOrder}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Trạng thái', style: Theme.of(context).textTheme.bodyText1),
            Text(order.status, style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ],
    );
  }
}

class _TicketPopup extends StatelessWidget {
  const _TicketPopup({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: order.idOrder,
      child: Container(
        padding:
            EdgeInsets.only(top: defaultPadding * 3, right: defaultPaddingIcon),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(defaultCircular)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonIconSmall(
                  icon: Icons.arrow_back_ios,
                  press: () {
                    Get.back();
                  },
                ),
                Text(
                  "Chi tiết chuyến đi",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(children: [
                Container(
                  child: _InfoBase(order: order),
                  margin: EdgeInsets.only(bottom: defaultPadding),
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(defaultCircular)),
                ),
                _InfoOrder(
                  titleInfo: 'Hãng xe',
                  describe: 'toyota vios',
                ),
                _InfoOrder(
                  titleInfo: 'Hãng xe',
                  describe: 'toyota vios',
                ),
                _InfoOrder(
                  titleInfo: 'Hãng xe',
                  describe: 'toyota vios',
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoOrder extends StatelessWidget {
  const _InfoOrder({
    Key? key,
    required this.titleInfo,
    required this.describe,
  }) : super(key: key);

  final String titleInfo;
  final String describe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleInfo,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          describe,
          style: Theme.of(context).textTheme.headline5,
        ),
        const Divider(
          thickness: 2,
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
