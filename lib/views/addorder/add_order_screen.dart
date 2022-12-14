import 'package:fgo/constants.dart';
import 'package:fgo/controllers/home_controller.dart';
import 'package:fgo/controllers/order_controller.dart';
import 'package:fgo/controllers/place_search_controller.dart';
import 'package:fgo/views/addorder/components/date_time_part.dart';
import 'package:fgo/views/addorder/components/estimate_part.dart';
import 'package:fgo/views/addorder/components/places_list_box.dart';
import 'package:fgo/views/addorder/components/select_car_part.dart';
import 'package:fgo/views/addorder/components/title_category.dart';
import 'package:fgo/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  var _placeController = Get.find<PlaceSearchController>();
  var _orderController = Get.find<OrderController>();
  var _homeController = Get.find<HomeController>();

  @override
  void initState() {
    _orderController.bookingDateController = TextEditingController();
    _orderController.bookingTimeController = TextEditingController();
    _placeController.startingAddressController = TextEditingController();
    _placeController.endAddressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _orderController.totalMoney.value = 0;
    _placeController.distance.value = 0;
    _orderController.selectQuantity.value = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: (() {
            Get.back();
          }),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          Center(
            child: Text(
              '?????t xe',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          const SizedBox(width: defaultPadding),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Category(title: '?????a ??i???m'),
            //?? nh???p ??i???m ????n
            TextField(
              controller: _placeController.startingAddressController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.add_circle_outline),
                hintText: '??i???m ????n',
              ),
              onChanged: (value) {
                _placeController.getListPlaces(
                    _placeController.searchResultsStrarting, value);
              },
            ),
            const SizedBox(height: defaultPadding / 2),
            Obx(
              () => Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //?? nh???p ??i???m ?????n
                      TextField(
                        controller: _placeController.endAddressController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_on_outlined),
                          hintText: '??i???m ?????n',
                        ),
                        onChanged: ((value) {
                          _placeController.getListPlaces(
                              _placeController.searchResultsEnd, value);
                        }),
                      ),
                      const SizedBox(height: defaultPadding),
                      Stack(
                        children: [
                          Column(
                            children: [
                              DateTimePart(
                                  orderController:
                                      _orderController), // Ch???n  ng??y gi???
                              const SizedBox(height: defaultPadding),
                              SelectCarPart(
                                  dataSelected: _orderController
                                      .selectQuantity), // ch???n lo???i xe
                              const SizedBox(height: defaultPadding),
                              ButtonFullWidth(
                                color: blueColor,
                                text: 'X??c nh???n',
                                press: () async {
                                  if (_placeController
                                          .idSourceLocation.isNotEmpty &&
                                      _placeController
                                          .idDestinationLocation.isNotEmpty &&
                                      _orderController.bookingDateController
                                          .text.isNotEmpty &&
                                      _orderController.bookingTimeController
                                          .text.isNotEmpty &&
                                      _orderController.selectQuantity != 0) {
                                    bool ktSetViTriDon =
                                        await _placeController.setViTriDon();
                                    bool ktSetViTriDen =
                                        await _placeController.setViTriDen();
                                    if (ktSetViTriDon & ktSetViTriDen) {
                                      bool ktLayDoanDuong =
                                          await _placeController
                                              .getPolyPoints();
                                      if (ktLayDoanDuong) {
                                        _placeController.tinhQuangDuong();
                                        _orderController.tinhTien(
                                            _placeController.distance.value);
                                      }
                                    } else {
                                      Get.snackbar(titleSnackbarOrder,
                                          'Vui l??ng nh???p l???i th??ng tin');
                                    }
                                  } else {
                                    Get.snackbar(titleSnackbarOrder,
                                        'B???n nh???p thi???u th??ng tin\nVui l??ng nh???p l???i');
                                  }
                                },
                              ),
                              const Divider(
                                thickness: defaultthickness,
                              ),
                              EstimatePart(
                                placeSearchController: _placeController,
                                orderController: _orderController,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: defaultPadding * 3),
                                child: ButtonFullWidth(
                                  text: '?????t xe',
                                  press: () async {
                                    if (_orderController.totalMoney != 0 &&
                                        _placeController.distance != 0) {
                                      bool ktDatDon =
                                          await _orderController.AddOrder(
                                              _homeController.idCustommer,
                                              _placeController
                                                  .idSourceLocation.value,
                                              _placeController
                                                  .startingAddressController
                                                  .text,
                                              _placeController
                                                  .idDestinationLocation.value,
                                              _placeController
                                                  .endAddressController.text,
                                              _placeController.districtSource,
                                              _placeController.distance.value
                                                  .toString());
                                      if (ktDatDon) {
                                        Get.back();
                                        Get.snackbar(titleSnackbarOrder,
                                            '?????t chuy???n ??i th??nh c??ng');
                                      } else {
                                        print("?????t chuy???n l???i!");
                                      }
                                    } else {
                                      Get.snackbar(titleSnackbarOrder,
                                          'B???n ch??a x??c nh???n ????n');
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          //box hi???n th??? list c???a ??i???m ?????n
                          _placeController.searchResultsEnd.length == 0
                              ? Container()
                              : PlacesListBox(
                                  idLocation:
                                      _placeController.idDestinationLocation,
                                  searchResults:
                                      _placeController.searchResultsEnd,
                                  placeSearchcontroller: _placeController,
                                  textController:
                                      _placeController.endAddressController,
                                ),
                        ],
                      )
                    ],
                  ),
                  //Box hi???n th??? list c???a ??i???m ????n
                  _placeController.searchResultsStrarting.length == 0
                      ? Container()
                      : PlacesListBox(
                          idLocation: _placeController.idSourceLocation,
                          searchResults:
                              _placeController.searchResultsStrarting,
                          placeSearchcontroller: _placeController,
                          textController:
                              _placeController.startingAddressController,
                        ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
