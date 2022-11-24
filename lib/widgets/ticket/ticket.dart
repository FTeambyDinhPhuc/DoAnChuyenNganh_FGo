import 'package:fgo/constants.dart';
import 'package:fgo/controllers/car_controller.dart';
import 'package:fgo/controllers/custommer_controller.dart';
import 'package:fgo/controllers/driver_controller.dart';
import 'package:fgo/controllers/order_controller.dart';
import 'package:fgo/models/car_model.dart';
import 'package:fgo/models/driver_model.dart';
import 'package:fgo/models/order_model.dart';
import 'package:fgo/methodshares/hero_dialog_route.dart';
import 'package:fgo/widgets/ticket/components/action_order.dart';
import 'package:fgo/widgets/ticket/components/info_base.dart';
import 'package:fgo/widgets/ticket/components/ticket_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key, required this.order}) : super(key: key);
  final OrderModel order;

  @override
  State<Ticket> createState() => _TicketState(order: order);
}

class _TicketState extends State<Ticket> {
  _TicketState({required this.order});
  final OrderModel order;

  var _custommerController = Get.put(CustommerController());
  var _driverController = Get.put(DriverController());
  var _carController = Get.put(CarController());
  var _orderController = Get.put(OrderController());

  DriverModel? _driver;
  List<CarModel>? _car;
  var isloadingDriverAndCar = true.obs;

  getDriverAndCar() async {
    if (order.idTaixe != null) {
      _driver = await _driverController.getDriver(order.idTaixe!);
      _carController.getCar(order.idTaixe!);
      _car = await _carController.getCar(order.idTaixe!);
      if (_driver != null && _car != null) {
        if (_car!.length != 0) {
          isloadingDriverAndCar.value = false;
        }
      }
    }
  }

  @override
  void initState() {
    _custommerController.getCustommer(order.idKhachhang);
    getDriverAndCar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => order.idTaixe != null
        ? isloadingDriverAndCar.value || _custommerController.isLoading.value
            ? Center(
                child: Image.asset(
                  'assets/images/loading.gif',
                  height: 100,
                ),
              )
            : mainTicket(context)
        : _custommerController.isLoading.value
            ? Center(
                child: Image.asset(
                  'assets/images/loading.gif',
                  height: 100,
                ),
              )
            : mainTicket(context));
  }

  GestureDetector mainTicket(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return TicketPopup(
            order: order,
            custommer: _custommerController.custommer,
            driver: _driver,
            car: _car?[0],
          );
        }));
      },
      child: Hero(
          tag: order.idChuyenxe,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(defaultCircular),
            ),
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                InfoBase(order: order),
                order.trangthai == statusWaitForConfirmation
                    ? ActionOrder(
                        title: 'Hủy chuyến',
                        color: Colors.red,
                        press: () {
                          _CancelOrder(context);
                        },
                      )
                    : order.trangthai == statusBooked
                        ? order.ngaydon !=
                                DateFormat("dd-MM-yyyy").format(DateTime.now())
                            ? ActionOrder(
                                title: 'Hủy chuyến',
                                color: Colors.red,
                                press: () {
                                  _CancelOrder(context);
                                },
                              )
                            : Container()
                        : order.trangthai == statusCompleted
                            ? order.danhgia == null
                                ? ActionOrder(
                                    title: 'Đánh giá',
                                    color: Theme.of(context).primaryColor,
                                    press: () {
                                      _RatingOrder(context);
                                    },
                                  )
                                : Container()
                            : Container()
              ],
            ),
          )),
    );
  }

  Future<dynamic> _RatingOrder(BuildContext context) {
    double diemDanhGia = 3.0;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Chuyến đi',
          style: Theme.of(context).textTheme.headline4,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Đánh giá chuyến đi của bạn',
              style: Theme.of(context).textTheme.headline6,
            ),
            RatingBar.builder(
                minRating: 1.0,
                initialRating: 3.0,
                itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                onRatingUpdate: (rantingvalue) {
                  diemDanhGia = rantingvalue;
                  print('Sao hiện tại: ${rantingvalue}');
                })
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                _orderController.RatingOrder(
                    order.idChuyenxe.toString(), diemDanhGia.toString());
              },
              child: Text(
                'Xác nhận',
              )),
        ],
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
                _orderController.CancelOrder(order.idChuyenxe);
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
