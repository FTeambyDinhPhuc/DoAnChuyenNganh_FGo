import 'dart:convert';

TaiNguyenModel taiNguyenModelFromJson(String str) =>
    TaiNguyenModel.fromJson(json.decode(str));

String taiNguyenModelToJson(TaiNguyenModel data) => json.encode(data.toJson());

class TaiNguyenModel {
  TaiNguyenModel({
    required this.giaxang,
    required this.tiencong,
  });

  int giaxang;
  int tiencong;

  factory TaiNguyenModel.fromJson(Map<String, dynamic> json) => TaiNguyenModel(
        giaxang: json["giaxang"],
        tiencong: json["tiencong"],
      );

  Map<String, dynamic> toJson() => {
        "giaxang": giaxang,
        "tiencong": tiencong,
      };
}
