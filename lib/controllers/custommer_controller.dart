import 'dart:convert';

import 'package:fgo/models/custommer_model.dart';
import 'package:fgo/services/customer_services.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class CustommerController extends GetxController {
  int idKhachHang = 2;
  RxString currentAvatar = ''.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getCustommer();
  }

  RxString hienThiTen = ''.obs;
  // void getCustommer() {
  //   print('hinh hien tai: ${custommer.avatar}');
  //   currentAvatar.value = custommer.avatar;
  // }

  Future<void> getCustommer() async {
    var custommer = await CustomerServices.getCustommer(idKhachHang);
    hienThiTen.value = custommer!.tenkhachhang;
    isLoading.value = false;
  }

  Future setImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    print('trả về chổ này: ${image.path}');

    currentAvatar.value = 'assets/images/bongocat.gif';
    //print('hinh hien tai: ${custommerList[0].hinh}');
  }
}
