import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  //Vị trí tài xế
  var driverLatiTude = 0.0.obs;
  var driverLongiTude = 0.0.obs;
  //google map add thêm vị trí mới
  var added = false.obs;
  //trạng thái đơn lấy từ api
  var statusMove = 'Tài xế đang đến...'.obs;
  //google map controller
  Completer<GoogleMapController> googleController = Completer();

  @override
  void onInit() async {
    super.onInit();
    getDriverLocation();
  }

  void getDriverLocation() async {
    Location location = Location();
    await location.getLocation().then(
      (location) {
        driverLatiTude.value = location.latitude!;
        driverLongiTude.value = location.longitude!;
      },
    );
    location.onLocationChanged.listen(
      (newLoc) {
        driverLatiTude.value = newLoc.latitude!;
        driverLongiTude.value = newLoc.longitude!;
      },
    );
  }

  void updateCameraMap() async {
    GoogleMapController googleMapController = await googleController.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(
          zoom: 16,
          target: LatLng(driverLatiTude.value, driverLongiTude.value))),
    );
  }
}
