import 'dart:convert';

import 'package:fgo/models/custommer_model.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class CustommerController extends GetxController {
  int idKhachHang = 2;
  RxString currentAvatar = ''.obs;
  var isLoading = true.obs;

  CustommerModel? custommer;

  @override
  void onInit() async {
    super.onInit();
    await getCustommer(2);
  }

  getCustommer(int id) async {
    try {
      var response =
          await http.get(Uri.parse('https://cn-api.fteamlp.top/api/users/$id'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        custommer = CustommerModel.fromJson(data['data']);
        isLoading.value = false;
      } else {
        Get.snackbar('Error Loading data!',
            'Server responded: ${response.statusCode}: ${response.reasonPhrase.toString()}');
      }
    } catch (e) {
      print('error get data is: $e');
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
