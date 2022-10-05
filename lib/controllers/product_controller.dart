import 'dart:convert';

import 'package:fgo/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    // ignore: unrelated_type_equality_checks
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
   
      for (var item in data) {
        productList.add(Product.fromJson(item));

        isLoading.value = false;
      }
    } else {
      Get.snackbar('Error Loading data!',
          'Server responded: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }
}
