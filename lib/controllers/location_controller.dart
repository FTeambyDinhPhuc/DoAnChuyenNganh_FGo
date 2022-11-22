import 'dart:async';
import 'package:fgo/services/fgo_app_services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  //Vị trí tài xế
  var driverLatiTude = 0.0.obs;
  var driverLongiTude = 0.0.obs;

  //Vị trí bản thân
  var currentLatiTude = 0.0.obs;
  var currentLongiTude = 0.0.obs;
  //google map add thêm vị trí mới
  var added = false.obs;

  //google map controller
  Completer<GoogleMapController> googleController = Completer();

  //dùng kéo vị trí tài xế
  bool stopGetLocationDriver = true;

  @override
  void onInit() async {
    super.onInit();
  }

  void getcurrentLocation() {
    Location location = Location();
    location.getLocation().then(
      (location) {
        currentLatiTude.value = location.latitude!;
        currentLongiTude.value = location.longitude!;
      },
    );
  }

  //Lấy danh sách đơn hàng gợi ý
  getDriverLocation(int idTaiXe) async {
    stopGetLocationDriver = false;
    Timer.periodic(Duration(seconds: 2), (timer) async {
      var taiXe = await FGoAppServices.fetchDriver(idTaiXe);
      if (taiXe != null) {
        driverLatiTude.value = taiXe.vido!;
        driverLongiTude.value = taiXe.kinhdo!;
      }
      print("Đang kéo vị trí tài xế");
      if (stopGetLocationDriver == true) {
        timer.cancel();
        print("Dừng kéo vị trí");
      }
    });
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
