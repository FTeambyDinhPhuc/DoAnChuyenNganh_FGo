import 'package:fgo/controllers/location_controller.dart';
import 'package:fgo/controllers/order_controller.dart';
import 'package:fgo/widgets/ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NowScreen extends StatefulWidget {
  const NowScreen({super.key});

  @override
  State<NowScreen> createState() => _NowScreenState();
}

class _NowScreenState extends State<NowScreen> {
  var _locationController = Get.put(LocationController());
  var _orderController = Get.put(OrderController());

  @override
  void initState() {
    _orderController.getStartingOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _orderController.orderList == null
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/bongocat.gif'),
                Text(
                  'Hôm nay bạn không có lịch!',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          )
        : Scaffold(
            appBar: AppBar(
                title: Center(
              child: Text(
                '${_locationController.statusMove.value}',
                style: Theme.of(context).textTheme.headline3,
              ),
            )),
            body: Stack(alignment: Alignment.bottomCenter, children: [
              Expanded(child: Obx(
                () {
                  if (_locationController.added.value) {
                    _locationController.updateCameraMap();
                  }
                  return GoogleMap(
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(_locationController.driverLatiTude.value,
                            _locationController.driverLongiTude.value),
                        zoom: 16),
                    markers: {
                      Marker(
                          markerId: MarkerId("currentLocation"),
                          position: LatLng(
                              _locationController.driverLatiTude.value,
                              _locationController.driverLongiTude.value)),
                    },
                    onMapCreated: (mapController) {
                      _locationController.googleController
                          .complete(mapController);
                      _locationController.added.value = true;
                    },
                  );
                },
              )),
              Ticket(order: _orderController.orderList[0])
            ]),
          );
  }
}
