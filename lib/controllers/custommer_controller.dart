import 'package:fgo/models/custommer_model.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustommerController extends GetxController {
  CustommerModel custommer = CustommerModel(
      idCustommer: 1,
      Name: 'Khách hàng 1',
      SDT: '0399128713',
      avatar: 'assets/images/bongocat.gif');
  RxString currentAvatar = ''.obs;

  void getCustommer() {
    print('hinh hien tai: ${custommer.avatar}');
    currentAvatar.value = custommer.avatar;
  }

  Future setImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    print('trả về chổ này: ${image.path}');
    currentAvatar.value = 'assets/images/cat_rainbow.gif';
    print('hinh hien tai: ${custommer.avatar}');
  }
}
