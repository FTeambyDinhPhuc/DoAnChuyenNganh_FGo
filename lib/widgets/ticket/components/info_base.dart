import 'package:fgo/constants.dart';
import 'package:fgo/models/driver_model.dart';
import 'package:fgo/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoBase extends StatelessWidget {
  InfoBase({Key? key, required this.order, this.driver}) : super(key: key);
  final OrderModel order;

  DriverModel? driver;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              order.idTaixe == null
                  ? 'assets/images/image_avatar_null.png'
                  : driver!.hinh,
            ),
            radius: defaultSizeImage,
          ),
          const SizedBox(width: defaultPadding),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.idTaixe == null ? 'Chưa có tài xế' : driver!.tentaixe,
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
                    order.idTaixe == null ? '0' : driver!.sosao.toString(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(width: defaultPadding),
                ],
              ),
            ],
          ),
          const SizedBox(width: defaultPadding),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Mã đơn: ",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    order.idChuyenxe.toString(),
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
              Text(
                order.danhgia == null ? notYetRated : haveEvaluated,
                style: Theme.of(context).textTheme.headline6,
              )
            ],
          ),
          const SizedBox(width: defaultPadding),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${order.ngaydon}',
                  style: Theme.of(context).textTheme.bodyText1),
              Text('Trạng thái', style: Theme.of(context).textTheme.bodyText1),
              Text(order.trangthai,
                  style: Theme.of(context).textTheme.headline5),
            ],
          ),
        ],
      ),
    );
  }
}
