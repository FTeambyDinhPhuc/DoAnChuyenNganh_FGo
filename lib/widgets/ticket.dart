import 'package:fgo/constants.dart';
import 'package:fgo/controllers/car_controller.dart';
import 'package:fgo/controllers/custommer_controller.dart';
import 'package:fgo/controllers/driver_controller.dart';
import 'package:fgo/controllers/order_controller.dart';
import 'package:fgo/controllers/place_search_controller.dart';
import 'package:fgo/models/car_model.dart';
import 'package:fgo/models/custommer_model.dart';
import 'package:fgo/models/driver_model.dart';
import 'package:fgo/models/order_model.dart';
import 'package:fgo/models/place.dart';
import 'package:fgo/widgets/button_full_width.dart';
import 'package:fgo/methodshares/hero_dialog_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  var diemDon;
  var diemDen;

  getDiaDiem() async {
    diemDon = await _placeController.getPlace(order.diemdon);
    diemDen = await _placeController.getPlace(order.diemden);
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
                _custommerController.isLoading.value ||
                _carController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
              )
            : mainTicket(context)
        : _custommerController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
              )
            : mainTicket(context));
  }

  GestureDetector mainTicket(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return _TicketPopup(
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
            margin: EdgeInsets.all(defaultPadding),
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
            child: _InfoBase(
              order: order,
              driver: _driverController.driver,
            ),
          )),
    );
  }
}

class _InfoBase extends StatelessWidget {
  _InfoBase({Key? key, required this.order, this.driver}) : super(key: key);
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
                style: Theme.of(context).textTheme.bodyText1,
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

class _TicketPopup extends StatelessWidget {
  _TicketPopup(
      {Key? key,
      required this.order,
      required this.orderController,
      this.diemDon,
      this.diemDen,
      this.custommer,
      this.driver,
      this.car})
      : super(key: key);
  final OrderModel order;
  final OrderController orderController;
  Place? diemDon;
  Place? diemDen;
  CustommerModel? custommer;
  DriverModel? driver;
  CarModel? car;

  @override
  Widget build(BuildContext context) {
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
                          child: _InfoBase(
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
                        _InfoOrder(
                          titleInfo: 'Tên tài xế',
                          describe: order.idTaixe == null
                              ? 'Chưa có tài xế'
                              : driver!.tentaixe,
                        ),
                        _InfoOrder(
                          titleInfo: 'Số điện thoại tài xế',
                          describe: order.idTaixe == null
                              ? 'Chưa có tài xế'
                              : driver!.sodienthoai,
                        ),
                        _InfoOrder(
                          titleInfo: 'Điểm tài xế',
                          describe: order.idTaixe == null
                              ? 'Chưa có tài xế'
                              : driver!.sosao.toString(),
                        ),
                        _InfoOrder(
                          titleInfo: 'Hãng xe',
                          describe: order.idTaixe == null
                              ? 'Chưa có tài xế'
                              : car!.hangxe,
                        ),
                        _InfoOrder(
                          titleInfo: 'Biển số xe',
                          describe: order.idTaixe == null
                              ? 'Chưa có tài xế'
                              : car!.bienso,
                        ),
                        _InfoOrder(
                          titleInfo: 'Số chổ',
                          describe: order.loaixe.toString(),
                        ),
                        _InfoOrder(
                          titleInfo: 'Tên khách hàng',
                          describe: custommer!.tenkhachhang,
                        ),
                        _InfoOrder(
                          titleInfo: 'Số điện thoại khách',
                          describe: custommer!.sodienthoai,
                        ),
                        _InfoOrder(
                          titleInfo: 'Điểm đón',
                          describe: diemDon!.name,
                        ),
                        _InfoOrder(
                          titleInfo: 'Điểm đến',
                          describe: diemDen!.name,
                        ),
                        _InfoOrder(
                          titleInfo: 'Ngày bắt đầu',
                          describe: order.ngaydon,
                        ),
                        _InfoOrder(
                          titleInfo: 'Giờ bắt đầu',
                          describe: order.giodon,
                        ),
                        order.trangthai != statusBooked &&
                                order.trangthai != statusWaitForConfirmation
                            ? Container()
                            : ButtonFullWidth(
                                text: 'Hủy chuyến',
                                color: Colors.red,
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
                                      content: Text(
                                        'Bạn chắc chắn muốn hủy chuyến không?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
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
                                              orderController.CancelOrder(
                                                  order.idChuyenxe);
                                            },
                                            child: Text(
                                              'Hủy chuyến',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )),
                                      ],
                                    ),
                                  );
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
          thickness: defaultthickness,
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}

Color ColorTicket(OrderModel order) {
  if (order.trangthai == statusStarting)
    return Colors.teal.shade300;
  else if (order.trangthai == statusCompleted)
    return Colors.blue.shade300;
  else if (order.trangthai == statusBooked)
    return Colors.lightGreen.shade300;
  else if (order.trangthai == statusWaitForConfirmation)
    return Colors.blueGrey.shade300;

  return Colors.red.shade300;
}
