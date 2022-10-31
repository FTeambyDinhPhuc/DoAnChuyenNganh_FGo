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
  var _placeController = Get.put(PlaceSearchController());
  var _orderController = Get.put(OrderController());

  var dataSelected = 0.obs;

  @override
  void initState() {
    _orderController.bookingDateController = TextEditingController();
    _orderController.bookingTimeController = TextEditingController();
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
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.add_circle_outline),
                hintText: 'Điểm đón',
              ),
              onChanged: (Value) {
                _placeController.getAutocomplete(Value);
                _placeController.sourceLocation.value = Value;
              },
            ),
            const SizedBox(height: defaultPadding / 2),
            Obx(
              () => Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.add_location_outlined),
                          hintText: 'Điểm đến',
                        ),
                        onChanged: (Value) {
                          _placeController.getAutocomplete(Value);
                          _placeController.destination.value = Value;
                        },
                      ),
                      const SizedBox(height: defaultPadding),
                      Stack(
                        children: [
                          Column(
                            children: [
                              DateTimePart(orderController: _orderController),
                              const SizedBox(height: defaultPadding),
                              SelectCarPart(dataSelected: dataSelected),
                              const SizedBox(height: defaultPadding),
                              EstimatePart(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: defaultPadding * 3),
                                child: ButtonFullWidth(
                                  text: 'Xác nhận',
                                  press: () {},
                                ),
                              )
                            ],
                          ),
                          if ( //_controller.searchResults != null &&
                          // _controller.searchResults.length != 0 &&
                          _placeController.destination.value != null &&
                              _placeController.destination.value != '')
                            PlacesListBox(
                              controller: _placeController,
                              returnPlace: _placeController.destination.value,
                            ),
                        ],
                      )
                    ],
                  ),
                  if ( //_controller.searchResults != null &&
                  // _controller.searchResults.length != 0 &&
                  _placeController.sourceLocation.value != null &&
                      _placeController.sourceLocation.value != '')
                    PlacesListBox(
                      controller: _placeController,
                      returnPlace: _placeController.sourceLocation.value,
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
