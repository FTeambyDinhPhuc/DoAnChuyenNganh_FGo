import 'package:fgo/controllers/map_controller.dart';
import 'package:fgo/models/order_model.dart';
import 'package:fgo/widgets/ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NowScreen extends StatelessWidget {
  const NowScreen({super.key});
  @override
  Widget build(BuildContext context) {
    //dữ liệu giả
    Order dataTest = Order(
        idOrder: 1,
        scoresStart: 5.0,
        nameDriver: 'Nguyễn Khuyết Danh',
        imageDriver: 'assets/images/image_splash.png',
        status: 'Đang chạy');
    //
    var controller = Get.put(MapController());
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          '${controller.statusMove.value}',
          style: Theme.of(context).textTheme.headline3,
        ),
      )),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Expanded(
          child: Obx(() => GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(
                        controller.latiTude.value, controller.longiTude.value),
                    zoom: 16),
                markers: {
                  Marker(
                      markerId: MarkerId("currentLocation"),
                      position: LatLng(controller.latiTude.value,
                          controller.longiTude.value)),
                },
                onMapCreated: (mapController) {
                  controller.googleController.complete(mapController);
                },
              )),
        ),
        Ticket(order: dataTest)
      ]),
    );
  }
}
