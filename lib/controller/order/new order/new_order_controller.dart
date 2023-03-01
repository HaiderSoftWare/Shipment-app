import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:ship_app/controller/auth/login_controller.dart';
import 'package:ship_app/controller/order/new%20order/upload_image_controller.dart';
import 'package:ship_app/view/shared/route/api_path.dart';

import '../../middleware/service.dart';
import '../../service/service.dart';

class NewOrderController extends GetxController {
  Service service = Service();
  final nameorderContoller = TextEditingController();
  final descorderContoller = TextEditingController();
  final priceorderContoller = TextEditingController();
  final linkorderContoller = TextEditingController();
  RxBool isLoading = false.obs;

  final contorllerImage = Get.put(UploadImageController());

  final contorllerLogin = Get.put(LoginController());
  SettingServices services = Get.find<SettingServices>();

  newOrder() async {
    String fileName = contorllerImage.image!.path.split('/').last;
    FormData formData = FormData.fromMap(
      {
        'product_name': nameorderContoller.text,
        'product_descr': descorderContoller.text,
        'product_link': linkorderContoller.text,
        'price': priceorderContoller.text,
        'product_image': await MultipartFile.fromFile(
          contorllerImage.image!.path,
          filename: fileName,
        ),
      },
    );
    service.postMethod(
      url: newOrderUrl,
      headers: {
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${services.sharedPreferences.getString('login_success')}'
      },
      data: formData,
      loading: isLoading,
      routePage: 'navi',
    );
  }

  @override
  void dispose() {
    priceorderContoller.dispose();
    nameorderContoller.dispose();
    descorderContoller.dispose();
    linkorderContoller.dispose();
    super.dispose();
  }
}
