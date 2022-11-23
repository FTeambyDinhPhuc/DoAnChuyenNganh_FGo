import 'package:fgo/constants.dart';
import 'package:fgo/controllers/location_controller.dart';
import 'package:fgo/controllers/order_controller.dart';
import 'package:fgo/widgets/ticket/ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({
    Key? key,
    required OrderController orderController,
    required LocationController locationController,
  })  : _orderController = orderController,
        _locationController = locationController,
        super(key: key);

  final OrderController _orderController;
  final LocationController _locationController;

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState(
      locationController: _locationController,
      orderController: _orderController);
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  _GoogleMapScreenState({
    required OrderController orderController,
    required LocationController locationController,
  })  : _orderController = orderController,
        _locationController = locationController;
  final OrderController _orderController;
  final LocationController _locationController;

  @override
  void initState() {
    _locationController
        .getDriverLocation(_orderController.startingOrderList![0].idTaixe!);
    super.initState();
  }

  @override
  void dispose() {
    _locationController.stopGetLocationDriver = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: Get.width,
        color: scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(
            horizontal: defaultPaddingSmall, vertical: defaultPadding),
        child: Obx(() => Text(
              '${_orderController.startingOrderList![0].trangthai}',
              style: Theme.of(context).textTheme.headline2,
            )),
      ),
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
                  markerId: MarkerId("driverLocation"),
                  position: LatLng(_locationController.driverLatiTude.value,
                      _locationController.driverLongiTude.value))
            },
            onMapCreated: (mapController) {
              _locationController.googleController.complete(mapController);
              _locationController.added.value = true;
            },
          );
        },
      )),
      Ticket(order: _orderController.startingOrderList![0])
    ]);
  }
}
