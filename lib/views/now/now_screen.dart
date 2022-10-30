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
  var _controllerLocation = Get.put(LocationController());
  var _controllerOrder = Get.put(OrderController());

  @override
  void initState() {
    _controllerOrder.getStartingOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          '${_controllerLocation.statusMove.value}',
          style: Theme.of(context).textTheme.headline3,
        ),
      )),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Expanded(child: Obx(
          () {
            if (_controllerLocation.added.value) {
              _controllerLocation.updateCameraMap();
            }
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(_controllerLocation.latiTude.value,
                      _controllerLocation.longiTude.value),
                  zoom: 16),
              markers: {
                Marker(
                    markerId: MarkerId("currentLocation"),
                    position: LatLng(_controllerLocation.latiTude.value,
                        _controllerLocation.longiTude.value)),
              },
              onMapCreated: (mapController) {
                _controllerLocation.googleController.complete(mapController);
                _controllerLocation.added.value = true;
              },
            );
          },
        )),
        Ticket(order: _controllerOrder.orderList[0])
      ]),
    );
  }
}
