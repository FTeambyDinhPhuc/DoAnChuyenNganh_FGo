import 'package:fgo/constants.dart';
import 'package:fgo/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderController extends GetxController {
  //danh sách order
  var orderList = <Order>[].obs;

  //texteditcontroller của text fiel
  late TextEditingController bookingDateController; //text fiel date
  late TextEditingController bookingTimeController; //text fiel time

  //Số chổ được chọn
  var selectQuantity = 0.obs;

  //Thành tiền
  var totalMoney = 0.obs;

  void getAllOrder() {
    orderList.value = [
      Order(
          idOrder: 0,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 0',
          imageDriver: 'assets/images/image_splash.png',
          status: statusBooked),
      Order(
          idOrder: 1,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 1',
          imageDriver: 'assets/images/image_splash.png',
          status: statusStarting),
      Order(
          idOrder: 2,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 2',
          imageDriver: 'assets/images/image_splash.png',
          status: statusCompleted),
      Order(
          idOrder: 3,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 3',
          imageDriver: 'assets/images/image_splash.png',
          status: statusCancelled),
      Order(
          idOrder: 4,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 4',
          imageDriver: 'assets/images/image_splash.png',
          status: statusWaitForConfirmation),
    ];
  }

  void getBookedOrder() {
    orderList.value = [
      Order(
          idOrder: 5,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 5',
          imageDriver: 'assets/images/image_splash.png',
          status: statusBooked),
      Order(
          idOrder: 6,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 6',
          imageDriver: 'assets/images/image_splash.png',
          status: statusWaitForConfirmation),
    ];
  }

  void getStartingOrder() {
    orderList.value = [
      Order(
          idOrder: 7,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 7',
          imageDriver: 'assets/images/image_splash.png',
          status: statusStarting),
    ];
  }

  void getHistoryOrder() {
    orderList.value = [
      Order(
          idOrder: 8,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 8',
          imageDriver: 'assets/images/image_splash.png',
          status: statusCompleted),
      Order(
          idOrder: 9,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 9',
          imageDriver: 'assets/images/image_splash.png',
          status: statusCancelled),
    ];
  }

  void getBookingDate(BuildContext context) async {
    DateTime? pickedData = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedData != null) {
      String formatteDate = DateFormat("dd-MM-yyyy").format(pickedData);
      bookingDateController.text = formatteDate;
    }
  }

  void getBookingTime(BuildContext context) async {
    TimeOfDay? pickedData =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (pickedData != null) {
      bookingTimeController.text =
          '${pickedData.hour.toString()} : ${pickedData.minute.toString()}';
    }
  }

  void tinhTien(int distance) {
    double nhienLieuTieuThu = 0.0; // xăng trên 1km
    double tienXangTheoXe = 0.0;
    double tienXang = 0.0;
    int tienCong = 0;
    double thanhTien = 0.0;

    if (selectQuantity != 0) {
      if (selectQuantity == 5) {
        nhienLieuTieuThu = 0.06;
      } else if (selectQuantity == 7) {
        nhienLieuTieuThu = 0.08;
      } else {
        nhienLieuTieuThu = 0.1;
      }

      tienXangTheoXe = nhienLieuTieuThu * gasPrice;

      tienXang = (distance * 2) * tienXangTheoXe;
      tienCong = distance * wage;

      thanhTien = tienXang + tienCong;
      totalMoney.value = thanhTien.round();
    }
  }
}
