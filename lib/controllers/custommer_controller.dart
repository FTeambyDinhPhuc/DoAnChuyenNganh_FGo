import 'package:fgo/models/custommer_model.dart';
import 'package:fgo/services/fgoapp_services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustommerController extends GetxController {
  RxString currentAvatar = ''.obs;
  var isLoading = true.obs;
  CustommerModel? custommer;

  //Lấy thông tin tài khoản
  getCustommer(int id) async {
    custommer = await FGoAppServices.fetchCustommer(id);
    if (custommer != null) {
      isLoading.value = false;
    } else
      print("Dữ liệu tài khoản chưa được đổ vào!");
  }

  Future setImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    print('trả về chổ này: ${image.path}');

    currentAvatar.value = 'assets/images/bongocat.gif';
    //print('hinh hien tai: ${custommerList[0].hinh}');
  }
}
