import 'dart:convert';

import 'package:fgo/models/custommer_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CustomerServices {
  static Future<CustommerModel?> getCustommer(int id) async {
    var response =
        await http.get(Uri.parse('https://cn-api.fteamlp.top/api/users/$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return CustommerModel.fromJson(data['data']);
    } else {
      Get.snackbar('Error Loading data!',
          'Server responded: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }
}
