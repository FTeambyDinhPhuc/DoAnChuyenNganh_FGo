import 'package:fgo/constants.dart';
import 'package:fgo/controllers/place_search_controller.dart';
import 'package:fgo/views/addorder/components/places_list_box.dart';
import 'package:fgo/views/addorder/components/title_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(PlaceSearchController());
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
                prefixIcon: Icon(Icons.search),
                hintText: 'Điểm đón',
              ),
              onChanged: (Value) {
                _controller.getAutocomplete(Value);
                _controller.sourceLocation.value = Value;
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
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Điểm đến',
                        ),
                        onChanged: (Value) {
                          _controller.getAutocomplete(Value);
                          _controller.destination.value = Value;
                        },
                      ),
                      const SizedBox(height: defaultPadding),
                      Stack(
                        children: [
                          Column(
                            children: [
                              Category(title: 'Thời gian'),
                            ],
                          ),
                          if ( //_controller.searchResults != null &&
                          // _controller.searchResults.length != 0 &&
                          _controller.destination.value != null &&
                              _controller.destination.value != '')
                            PlacesListBox(
                              controller: _controller,
                              returnPlace: _controller.destination.value,
                            ),
                        ],
                      )
                    ],
                  ),
                  if ( //_controller.searchResults != null &&
                  // _controller.searchResults.length != 0 &&
                  _controller.sourceLocation.value != null &&
                      _controller.sourceLocation.value != '')
                    PlacesListBox(
                      controller: _controller,
                      returnPlace: _controller.sourceLocation.value,
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
