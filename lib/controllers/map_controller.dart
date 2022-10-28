import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapController extends GetxController {
  var latiTude = 0.0.obs;
  var longiTude = 0.0.obs;
  var statusMove = 'Tài xế đang đến...'.obs;
  Completer<GoogleMapController> googleController = Completer();

  @override
  void onInit() async {
    super.onInit();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
      (location) {
        latiTude.value = location.latitude!;
        longiTude.value = location.longitude!;
      },
    );

    GoogleMapController googleMapController = await googleController.future;

    location.onLocationChanged.listen(
      (newLoc) {
        latiTude.value = newLoc.latitude!;
        longiTude.value = newLoc.longitude!;
        googleMapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                zoom: 16,
                target: LatLng(newLoc.latitude!, newLoc.longitude!))));
      },
    );
  }
}
