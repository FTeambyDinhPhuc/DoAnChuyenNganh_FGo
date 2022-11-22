import 'package:fgo/controllers/home_controller.dart';
import 'package:fgo/models/custommer_model.dart';
import 'package:fgo/services/fgo_app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustommerController extends GetxController {
  RxString currentAvatar = ''.obs;
  var isLoading = true.obs;
  CustommerModel? custommer;

  //text edit controller của màn hình đổi mật khẩu
  late TextEditingController matkhaucuController;
  late TextEditingController matkhaumoiController;
  late TextEditingController xacnhanmatkhaumoiController;
  //text edit controller của màn hình update thông tin
  late TextEditingController sodienthoaiController;
  late TextEditingController tenkhachhangController;
  late TextEditingController cccdController;

  //Lấy thông tin tài khoản
  getCustommer(int id) async {
    isLoading.value = true;
    custommer = await FGoAppServices.fetchCustommer(id);
    if (custommer != null) {
      isLoading.value = false;
    } else
      print("Dữ liệu tài khoản chưa được đổ vào!");
  }

  //khởi tạo text edit controller của màn hình đổi mật khẩu
  getTextEditControllerChangePass() {
    matkhaucuController = TextEditingController();
    matkhaumoiController = TextEditingController();
    xacnhanmatkhaumoiController = TextEditingController();
  }

  //khởi tạo text edit controller của màn hình cập nhật thông tin
  getTextEditControllerChangeInfo() {
    sodienthoaiController = TextEditingController();
    tenkhachhangController = TextEditingController();
    cccdController = TextEditingController();
    sodienthoaiController.text = custommer!.sodienthoai;
    tenkhachhangController.text = custommer!.tenkhachhang;
    cccdController.text = custommer!.cccd;
  }

  //Đổi mật khẩu
  updatePass(String idKhachHang, BuildContext context,
      HomeController _homeController) async {
    if (matkhaucuController.text.isNotEmpty &&
        matkhaumoiController.text.isNotEmpty &&
        xacnhanmatkhaumoiController.text.isNotEmpty) {
      if (matkhaucuController.text != _homeController.passCustommer.value) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Sai mật khẩu!',
              style: Theme.of(context).textTheme.headline4,
            ),
            content: Text(
              'Vui lòng nhập lại',
              style: Theme.of(context).textTheme.headline6,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Đồng ý',
                  )),
            ],
          ),
        );
      } else if (matkhaumoiController.text !=
          xacnhanmatkhaumoiController.text) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Mật khẩu xác nhận không đúng!',
              style: Theme.of(context).textTheme.headline4,
            ),
            content: Text(
              'Vui lòng nhập lại',
              style: Theme.of(context).textTheme.headline6,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Đồng ý',
                  )),
            ],
          ),
        );
      } else {
        bool? updatePassError = await FGoAppServices.fetchUpdatePass(
            idKhachHang, xacnhanmatkhaumoiController.text);
        if (!updatePassError!) {
          _homeController.logout();
          Get.snackbar('Tài khoản', 'Đổi mật khẩu thành công');
        }
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Bạn nhập thiếu thông tin!',
            style: Theme.of(context).textTheme.headline4,
          ),
          content: Text(
            'Vui lòng nhập lại',
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Đồng ý',
                )),
          ],
        ),
      );
    }
  }

  // Thay đổi hình
  updateImage(String idKhachHang, String hinh) async {
    bool? updateImageError =
        await FGoAppServices.fetchUpdateImage(idKhachHang, hinh);
    if (!updateImageError!) {
      Get.back();
      isLoading.value = true;
      getCustommer(int.parse(idKhachHang));
      Get.snackbar('Tài khoản', 'Cập nhật hình đại diện thành công');
    }
  }

  //update thông tin
  updateInfo(String idKhachHang, BuildContext context) async {
    if (sodienthoaiController.text.isNotEmpty &&
        tenkhachhangController.text.isNotEmpty &&
        cccdController.text.isNotEmpty) {
      bool? updateInfoError = await FGoAppServices.fetchUpdateInfo(
          idKhachHang,
          sodienthoaiController.text,
          tenkhachhangController.text,
          cccdController.text);
      if (!updateInfoError!) {
        Get.back();
        isLoading.value = true;
        getCustommer(int.parse(idKhachHang));
        Get.snackbar('Tài khoản', 'Cập nhật thông tin thành công');
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Bạn nhập thiếu thông tin!',
            style: Theme.of(context).textTheme.headline4,
          ),
          content: Text(
            'Vui lòng nhập lại',
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Đồng ý',
                )),
          ],
        ),
      );
    }
  }

  Future setImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    print('trả về chổ này: ${image.path}');

    currentAvatar.value = 'assets/images/bongocat.gif';
    //print('hinh hien tai: ${custommerList[0].hinh}');
  }
}
