import 'package:fgo/constants.dart';
import 'package:fgo/models/order_model.dart';
import 'package:fgo/services/fgo_app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderController extends GetxController {
  //danh sách order
  RxList<OrderModel>? historyOrderList;
  RxList<OrderModel>? bookedOrderList;
  RxList<OrderModel>? startingOrderList;

  var isLoadingNowScreen = true.obs;
  var isLoadingBookedScreen = true.obs;
  var isLoadingHistoryScreen = true.obs;

  //texteditcontroller của text fiel
  late TextEditingController bookingDateController; //text fiel date
  late TextEditingController bookingTimeController; //text fiel time

  //Số chổ được chọn
  var selectQuantity = 0.obs;

  //Thành tiền
  var totalMoney = 0.obs;

  getBookedOrder(int id) async {
    isLoadingBookedScreen.value = true;
    var list = await FGoAppServices.fetchBookedOrderList(id);
    if (list != null) {
      bookedOrderList = list.obs;
      isLoadingBookedScreen.value = false;
    }
  }

  getStartingOrder(int id, String dateNow) async {
    isLoadingNowScreen.value = true;
    var list = await FGoAppServices.fetchStartingOrderList(id, dateNow);
    if (list != null) {
      startingOrderList = list.obs;
      isLoadingNowScreen.value = false;
    }
  }

  getHistoryOrder(int id) async {
    isLoadingHistoryScreen.value = true;
    var list = await FGoAppServices.fetchHistoryOrderList(id);
    if (list != null) {
      historyOrderList = list.obs;
      isLoadingHistoryScreen.value = false;
    }
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

  //thêm đơn
  AddOrder(
    String idKhachhang,
    String diemDon,
    String diemDen,
    String khuVucDon,
    String quangDuong,
  ) async {
    bool? addOrderError = await FGoAppServices.fetchAddOrder(
        idKhachhang,
        diemDon,
        diemDen,
        khuVucDon,
        bookingDateController.text,
        bookingTimeController.text,
        selectQuantity.value.toString(),
        quangDuong,
        totalMoney.value.toString());
    if (!addOrderError!) {
      Get.back();
      Get.snackbar(titleSnackbarOrder, 'Đặt chuyến đi thành công');
    } else
      print("Đặt chuyến lỗi!");
  }

  //hủy đơn
  CancelOrder(int idChuyenXe) async {
    var cancelOrderSuccess = await FGoAppServices.fetchCancelOrder(idChuyenXe);
    if (cancelOrderSuccess == 1) {
      Get.back();
      Get.snackbar(titleSnackbarOrder, 'Hủy chuyến đi thành công');
    } else {
      print("Hủy chuyến lỗi!");
    }
  }

  //đánh giá đơn
  RatingOrder(String idChuyenXe, String diem) async {
    var ratingOrderErorr =
        await FGoAppServices.fetchRatingOrder(idChuyenXe, diem);
    if (ratingOrderErorr == false) {
      Get.back();
      Get.snackbar(titleSnackbarOrder, 'Đánh giá thành công');
    } else {
      print("Đánh giá lỗi!");
    }
  }
}
