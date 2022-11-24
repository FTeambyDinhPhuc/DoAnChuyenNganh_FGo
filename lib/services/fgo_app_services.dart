import 'dart:convert';

import 'package:fgo/models/car_model.dart';
import 'package:fgo/models/custommer_model.dart';
import 'package:fgo/models/driver_model.dart';
import 'package:fgo/models/google_map_api_model.dart';
import 'package:fgo/models/order_model.dart';
import 'package:fgo/models/tainguyen_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FGoAppServices {
  //Hàm đăng nhập bằng api
  static Future<CustommerModel?> fetchLogin(String sdt, String password) async {
    var map = {};
    map['sodienthoai'] = sdt;
    map['matkhau'] = password;
    final response = await http.post(
        Uri.parse('https://cn-api.fteamlp.top/api/users/login'),
        body: map);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 0) {
        Get.snackbar('Lỗi đăng nhập!', data['data']);
        return null;
      }
      return CustommerModel.fromJson(data['data']);
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //Đăng ký
  static Future<bool?> fetchRegister(
      String sdt, String tenHienThi, String cccd, String password) async {
    var map = {};
    map['sodienthoai'] = sdt;
    map['tenkhachhang'] = tenHienThi;
    map['cccd'] = cccd;
    map['matkhau'] = password;
    final response = await http.post(
        Uri.parse('https://cn-api.fteamlp.top/api/users/register'),
        body: map);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['error'] == true) {
        Get.snackbar('Lỗi đăng ký!', data['data']);
      }
      return data['error'];
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //lấy google map api key từ database
  static Future<GoogleMapApiModel?> fetchGoogleMapAPIKey() async {
    var response =
        await http.get(Uri.parse('https://cn-api.fteamlp.top/api/apikey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 0) {
        Get.snackbar('Không lấy được key!', data['data']);
        return null;
      }
      return GoogleMapApiModel.fromJson(data['data']);
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //lấy tài nguyên từ database
  static Future<TaiNguyenModel?> fetchTaiNguyen() async {
    var response = await http.get(
        Uri.parse('https://cn-api.fteamlp.top/api/tainguyen/LayTaiNguyen'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['error'] == true) {
        Get.snackbar('Không lấy được tài nguyên!', data['message']);
        return null;
      }
      return TaiNguyenModel.fromJson(data['data']);
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //Lấy thông tin 1 khách hàng
  static Future<CustommerModel?> fetchCustommer(int id) async {
    final response = await http
        .get(Uri.parse('https://cn-api.fteamlp.top/api/users/getUser/$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 0) {
        Get.snackbar('Lỗi lấy dữ liệu!', data['data']);
        return null;
      }
      return CustommerModel.fromJson(data['data']);
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //cập nhật mật khẩu khách hàng
  static Future<bool?> fetchUpdatePass(
    String idKhachHang,
    String matKhau,
  ) async {
    var map = {};
    map['id_khachhang'] = idKhachHang;
    map['matkhau'] = matKhau;

    final response = await http.patch(
        Uri.parse('https://cn-api.fteamlp.top/api/users/CapNhatMatKhau'),
        body: map);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['error'] == true) {
        Get.snackbar('Lỗi đổi mật khẩu!', data['message']);
      }
      return data['error'];
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //cập nhật hình khách hàng
  static Future<bool?> fetchUpdateImage(
    String idKhachHang,
    String hinh,
  ) async {
    var map = {};
    map['id_khachhang'] = idKhachHang;
    map['hinh'] = hinh;

    final response = await http.patch(
        Uri.parse('https://cn-api.fteamlp.top/api/users/CapNhatHinhKH'),
        body: map);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['error'] == true) {
        Get.snackbar('Lỗi cập nhật hình!', data['message']);
      }
      return data['error'];
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //cập nhật thông tin khách hàng
  static Future<bool?> fetchUpdateInfo(
    String idKhachHang,
    String soDienThoai,
    String tenkhachHang,
    String cccd,
  ) async {
    var map = {};
    map['sodienthoai'] = soDienThoai;
    map['tenkhachhang'] = tenkhachHang;
    map['cccd'] = cccd;

    final response = await http.patch(
        Uri.parse(
            'https://cn-api.fteamlp.top/api/users/updateUser/${idKhachHang}'),
        body: map);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['error'] == true) {
        Get.snackbar('Lỗi cập nhật thông tin!', data['message']);
      }
      return data['error'];
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //Lấy thông tin 1 tài xế
  static Future<DriverModel?> fetchDriver(int id) async {
    final response = await http
        .get(Uri.parse('https://cn-api.fteamlp.top/api/taixe/getTaiXe/${id}'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 0) {
        Get.snackbar('Lỗi lấy dữ liệu!', data['data']);
        return null;
      }
      return DriverModel.fromJson(data['data']);
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //Lấy thông tin xe theo id tài xế
  static Future<List<CarModel>?> fetchCar(int id) async {
    final response = await http
        .get(Uri.parse('https://cn-api.fteamlp.top/api/xe/getInforById/${id}'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['error'] == true) {
        Get.snackbar('Lỗi lấy dữ liệu!', data['message']);
        return null;
      }
      List<CarModel> tutorList = [];
      for (var item in data['data']) {
        tutorList.add(CarModel.fromJson(item));
      }
      return tutorList;
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //đặt xe
  static Future<bool?> fetchAddOrder(
    String idKhachhang,
    String diemDon,
    String tenDiemDon,
    String diemDen,
    String tenDiemDen,
    String khuVucDon,
    String ngayDon,
    String gioDon,
    String loaiXe,
    String quangDuong,
    String thanhTien,
  ) async {
    var map = {};
    map['id_khachhang'] = idKhachhang;
    map['diemdon'] = diemDon;
    map['tendiemdon'] = tenDiemDon;
    map['diemden'] = diemDen;
    map['tendiemden'] = tenDiemDen;
    map['khuvucdon'] = khuVucDon;
    map['ngaydon'] = ngayDon;
    map['giodon'] = gioDon;
    map['loaixe'] = loaiXe;
    map['quangduong'] = quangDuong;
    map['thanhtien'] = thanhTien;

    final response = await http.post(
        Uri.parse('https://cn-api.fteamlp.top/api/users/datxe'),
        body: map);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['error'] == true) {
        Get.snackbar('Lỗi đặt chuyến!', data['data']);
      }
      return data['error'];
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //Lấy danh sách lịch sử đơn hàng
  static Future<List<OrderModel>?> fetchHistoryOrderList(int id) async {
    final response = await http.get(
      Uri.parse(
          "https://cn-api.fteamlp.top/api/users/getHistoryChuyenXe/${id}"),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 0) {
        Get.snackbar('Lỗi lấy dữ liệu!', data['data']);
        return null;
      }
      List<OrderModel> tutorList = [];
      for (var item in data['data']) {
        tutorList.add(OrderModel.fromJson(item));
      }
      return tutorList;
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //Lấy danh sách đơn hàng đã đặt
  static Future<List<OrderModel>?> fetchBookedOrderList(int id) async {
    final response = await http.get(
      Uri.parse(
          "https://cn-api.fteamlp.top/api/users/getHistoryChuyenXeDaDat/${id}"),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 0) {
        Get.snackbar('Lỗi lấy dữ liệu!', data['data']);
        return null;
      }
      List<OrderModel> tutorList = [];
      for (var item in data['data']) {
        tutorList.add(OrderModel.fromJson(item));
      }
      return tutorList;
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //Lấy danh sách đơn hàng hôm nay
  static Future<List<OrderModel>?> fetchStartingOrderList(
      int id, String dateNow) async {
    final response = await http.get(
      Uri.parse(
          'https://cn-api.fteamlp.top/api/users/getChuyenXeBydate/${id}/${dateNow}'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 0) {
        Get.snackbar('Lỗi lấy dữ liệu!', data['data']);
        return null;
      }
      List<OrderModel> tutorList = [];
      for (var item in data['data']) {
        tutorList.add(OrderModel.fromJson(item));
      }
      return tutorList;
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //hủy chuyến
  static fetchCancelOrder(int idChuyenXe) async {
    final response = await http.patch(
      Uri.parse('https://cn-api.fteamlp.top/api/users/HuyChuyen/${idChuyenXe}'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 0) {
        Get.snackbar('Lỗi hủy chuyến!', data['data']);
      }
      return data['success'];
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //đánh giá chuyến đi
  static fetchRatingOrder(String idChuyenXe, String diem) async {
    var map = {};
    map['id_chuyenxe'] = idChuyenXe;
    map['danhgia'] = diem;

    final response = await http.patch(
        Uri.parse('https://cn-api.fteamlp.top/api/users/capnhatsao'),
        body: map);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['error'] == true) {
        Get.snackbar('Lỗi đánh giá!', data['data']);
      }
      return data['error'];
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }
}
