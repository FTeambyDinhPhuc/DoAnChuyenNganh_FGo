import 'dart:async';
import 'package:fgo/services/fgo_app_services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  //Vị trí tài xế
  var driverLatiTude = 0.0.obs;
  var driverLongiTude = 0.0.obs;

  //google map add thêm vị trí mới
  var added = false.obs;

  //google map controller
  Completer<GoogleMapController> googleController = Completer();

  //dùng kéo vị trí tài xế
  bool stopGetLocationDriver = true;

  //Lấy vị trí tài xế
  getDriverLocation(int idTaiXe) async {
    stopGetLocationDriver = false;
    Timer.periodic(Duration(seconds: 2), (timer) async {
      var _taiXe = await FGoAppServices.fetchDriver(idTaiXe);
      if (_taiXe != null) {
        driverLatiTude.value = _taiXe.vido ?? 0.0;
        driverLongiTude.value = _taiXe.kinhdo ?? 0.0;
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
