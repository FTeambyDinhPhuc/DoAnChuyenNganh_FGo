import 'package:fgo/constants.dart';
import 'package:fgo/controllers/car_controller.dart';
import 'package:fgo/controllers/custommer_controller.dart';
import 'package:fgo/controllers/driver_controller.dart';
import 'package:fgo/controllers/order_controller.dart';
import 'package:fgo/controllers/place_search_controller.dart';
import 'package:fgo/models/order_model.dart';
import 'package:fgo/models/place.dart';
import 'package:fgo/methodshares/hero_dialog_route.dart';
import 'package:fgo/widgets/ticket/components/color_ticket.dart';
import 'package:fgo/widgets/ticket/components/info_base.dart';
import 'package:fgo/widgets/ticket/components/ticket_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  var _placeController = Get.put(PlaceSearchController());
  var _orderController = Get.put(OrderController());

  var diemDon = ''.obs;
  var diemDen = ''.obs;

  getDiaDiem() async {
    Place placeDiemDon = await _placeController.getPlace(order.diemdon);
    Place placeDiemDen = await _placeController.getPlace(order.diemden);
    if (placeDiemDon != null) {
      diemDon.value = placeDiemDon.name;
    } else {
      print('Không lấy được điểm đón!');
    }
    if (placeDiemDen != null) {
      diemDen.value = placeDiemDen.name;
    } else {
      print('Không lấy được điểm đến!');
    }
  }

  @override
  void initState() {
    _custommerController.getCustommer(order.idKhachhang);
    getDiaDiem();
    if (order.idTaixe != null) {
      _driverController.getDriver(order.idTaixe!);
      _carController.getCar(order.idTaixe!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => order.idTaixe != null
        ? _driverController.isLoading.value ||
                _carController.isLoading.value ||
                _custommerController.isLoading.value ||
                diemDon == '' ||
                diemDen == ''
            ? Center(
                child: Image.asset(
                  'assets/images/loading.gif',
                  height: 100,
                ),
              )
            : mainTicket(context)
        : _custommerController.isLoading.value || diemDon == '' || diemDen == ''
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
            orderController: _orderController,
            diemDon: diemDon,
            diemDen: diemDen,
            custommer: _custommerController.custommer,
            driver: _driverController.driver,
            car: _carController.car,
          );
        }));
      },
      child: Hero(
          tag: order.idChuyenxe,
          child: Container(
            height: 100,
            margin: EdgeInsets.fromLTRB(
              defaultPadding,
              0,
              defaultPadding,
              defaultPadding,
            ),
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: ColorTicket(order),
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
            child: InfoBase(
              order: order,
              driver: _driverController.driver,
            ),
          )),
    );
  }
}
