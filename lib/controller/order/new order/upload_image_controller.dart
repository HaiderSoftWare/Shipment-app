import 'package:get/get.dart' hide FormData, MultipartFile;

import 'package:image_picker/image_picker.dart';

class UploadImageController extends GetxController {
  XFile? image;
  uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final img = await picker.pickImage(source: ImageSource.gallery);
    image = img;
    update();
  }

  removeImage() {
    image = null;
    update();
  }
}
