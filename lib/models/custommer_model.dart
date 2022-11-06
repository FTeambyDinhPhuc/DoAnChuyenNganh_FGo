import 'dart:convert';

CustommerModel custommerModelFromJson(String str) =>
    CustommerModel.fromJson(json.decode(str));

String custommerModelToJson(CustommerModel data) => json.encode(data.toJson());

class CustommerModel {
  CustommerModel({
    required this.idKhachhang,
    required this.sodienthoai,
    required this.matkhau,
    required this.tenkhachhang,
    required this.cccd,
    required this.hinh,
  });

  int idKhachhang;
  String sodienthoai;
  String matkhau;
  String tenkhachhang;
  String cccd;
  String hinh;

  factory CustommerModel.fromJson(Map<String, dynamic> json) => CustommerModel(
        idKhachhang: json["id_khachhang"],
        sodienthoai: json["sodienthoai"],
        matkhau: json["matkhau"],
        tenkhachhang: json["tenkhachhang"],
        cccd: json["cccd"],
        hinh: json["hinh"],
      );

  Map<String, dynamic> toJson() => {
        "id_khachhang": idKhachhang,
        "sodienthoai": sodienthoai,
        "matkhau": matkhau,
        "tenkhachhang": tenkhachhang,
        "cccd": cccd,
        "hinh": hinh,
      };
}
