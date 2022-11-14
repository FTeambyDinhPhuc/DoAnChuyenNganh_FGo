import 'package:fgo/constants.dart';
import 'package:fgo/controllers/order_controller.dart';
import 'package:fgo/models/car_model.dart';
import 'package:fgo/models/custommer_model.dart';
import 'package:fgo/models/driver_model.dart';
import 'package:fgo/models/order_model.dart';
import 'package:fgo/widgets/button_full_width.dart';
import 'package:fgo/widgets/ticket/components/color_ticket.dart';
import 'package:fgo/widgets/ticket/components/info_base.dart';
import 'package:fgo/widgets/ticket/components/info_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TicketPopup extends StatelessWidget {
  TicketPopup(
      {Key? key,
      required this.order,
      required this.orderController,
      required this.diemDon,
      required this.diemDen,
      this.custommer,
      this.driver,
      this.car})
      : super(key: key);
  final OrderModel order;
  final OrderController orderController;
  RxString diemDon;
  RxString diemDen;
  CustommerModel? custommer;
  DriverModel? driver;
  CarModel? car;

  @override
  Widget build(BuildContext context) {
    var moneyFormat = new NumberFormat("###,###,###");
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Hero(
          tag: order.idChuyenxe,
          child: Container(
            constraints: BoxConstraints(maxHeight: Get.height / 1.5),
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(defaultCircular)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Chi tiết chuyến đi",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(height: defaultPadding),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: InfoBase(
                            order: order,
                            driver: driver,
                          ),
                          margin: EdgeInsets.only(bottom: defaultPadding),
                          padding: EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                              color: ColorTicket(order),
                              borderRadius:
                                  BorderRadius.circular(defaultCircular)),
                        ),
                        InfoOrder(
                          titleInfo: 'Tên tài xế',
                          describe: order.idTaixe == null
                              ? 'Chưa có tài xế'
                              : driver!.tentaixe,
                        ),
                        InfoOrder(
                          titleInfo: 'Số điện thoại tài xế',
                          describe: order.idTaixe == null
                              ? 'Chưa có tài xế'
                              : driver!.sodienthoai,
                        ),
                        InfoOrder(
                          titleInfo: 'Điểm tài xế',
                          describe: order.idTaixe == null
                              ? 'Chưa có tài xế'
                              : driver!.sosao.toString(),
                        ),
                        InfoOrder(
                          titleInfo: 'Hãng xe',
                          describe: order.idTaixe == null
                              ? 'Chưa có tài xế'
                              : car!.hangxe,
                        ),
                        InfoOrder(
                          titleInfo: 'Biển số xe',
                          describe: order.idTaixe == null
                              ? 'Chưa có tài xế'
                              : car!.bienso,
                        ),
                        InfoOrder(
                          titleInfo: 'Số chổ',
                          describe: order.loaixe.toString(),
                        ),
                        InfoOrder(
                          titleInfo: 'Tên khách hàng',
                          describe: custommer!.tenkhachhang,
                        ),
                        InfoOrder(
                          titleInfo: 'Số điện thoại khách',
                          describe: custommer!.sodienthoai,
                        ),
                        InfoOrder(
                          titleInfo: 'Điểm đón',
                          describe: diemDon.value,
                        ),
                        InfoOrder(
                          titleInfo: 'Điểm đến',
                          describe: diemDen.value,
                        ),
                        InfoOrder(
                          titleInfo: 'Ngày bắt đầu',
                          describe: order.ngaydon,
                        ),
                        InfoOrder(
                          titleInfo: 'Giờ bắt đầu',
                          describe: order.giodon,
                        ),
                        InfoOrder(
                          titleInfo: 'Quảng đường',
                          describe: '${order.quangduong.toString()} km',
                        ),
                        InfoOrder(
                          titleInfo: 'Tổng tiền',
                          describe:
                              '${moneyFormat.format(order.thanhtien)} vnđ',
                        ),
                        InfoOrder(
                          titleInfo: 'Đánh giá chuyến đi',
                          describe: order.danhgia == null
                              ? notYetRated
                              : '${order.danhgia}/5 điểm',
                        ),
                        order.trangthai != statusWaitForConfirmation
                            ? order.trangthai == statusCompleted &&
                                    order.danhgia == null
                                ? ButtonFullWidth(
                                    text: 'Đánh giá',
                                    press: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text(
                                            'Chuyến đi',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Đánh giá chuyến đi của bạn',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                              ),
                                              RatingBar.builder(
                                                  minRating: 1,
                                                  initialRating: 3,
                                                  itemBuilder:
                                                      (context, index) => Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                  onRatingUpdate:
                                                      (rantingvalue) {
                                                    print(
                                                        'Sao hien tại: ${rantingvalue}');
                                                  })
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text(
                                                  'Xác nhận',
                                                )),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                : Container()
                            : ButtonFullWidth(
                                text: 'Hủy chuyến',
                                color: Colors.red,
                                press: () {
                                  _CancelOrder(context);
                                })
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _CancelOrder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Chuyến đi',
          style: Theme.of(context).textTheme.headline4,
        ),
        content: Text(
          'Bạn chắc chắn muốn hủy chuyến không?',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Không',
              )),
          TextButton(
              onPressed: () {
                orderController.CancelOrder(order.idChuyenxe);
              },
              child: Text(
                'Hủy chuyến',
                style: TextStyle(color: Colors.red),
              )),
        ],
      ),
    );
  }
}
