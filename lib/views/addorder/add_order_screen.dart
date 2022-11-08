import 'package:fgo/constants.dart';
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

  @override
  void initState() {
    _orderController.bookingDateController = TextEditingController();
    _orderController.bookingTimeController = TextEditingController();
    _placeController.startingAddressController = TextEditingController();
    _placeController.endAddressController = TextEditingController();
    super.initState();
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
              'Đặt xe',
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
            Category(title: 'Địa điểm'),
            //ô nhập điểm đón
            TextField(
              controller: _placeController.startingAddressController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.add_circle_outline),
                hintText: 'Điểm đón',
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
                      //ô nhập điểm đến
                      TextField(
                        controller: _placeController.endAddressController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_on_outlined),
                          hintText: 'Điểm đến',
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
                              DateTimePart(orderController: _orderController),
                              const SizedBox(height: defaultPadding),
                              SelectCarPart(
                                  dataSelected:
                                      _orderController.selectQuantity),
                              const SizedBox(height: defaultPadding),
                              ButtonFullWidth(
                                color: Colors.blue.shade300,
                                text: 'Xác nhận',
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
                                    await _placeController.setViTriDon();
                                    await _placeController.setViTriDen();
                                    await _placeController.getPolyPoints();
                                    _placeController.tinhQuangDuong();
                                    _orderController.tinhTien(
                                        _placeController.distance.value);
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text(
                                          'Bạn nhập thiếu thông tin!',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                        content: Text(
                                          'Vui lòng nhập lại',
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
                                                'Đồng ý',
                                              )),
                                        ],
                                      ),
                                    );
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
                                  text: 'Đặt xe',
                                  press: () {
                                    Get.back();
                                    Get.snackbar(titleSnackbarOrder,
                                        'Đặt chuyến đi thành công');
                                  },
                                ),
                              )
                            ],
                          ),
                          //box hiển thị list của điểm đến
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
                  //Box hiển thị list của điểm đón
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
