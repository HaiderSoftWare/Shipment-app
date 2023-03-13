import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:ship_app/controller/order/new%20order/upload_image_controller.dart';
import 'package:ship_app/service/api.dart';

class NewOrderController extends GetxController {
  final isLoading = false.obs;
  final nameorderContoller = TextEditingController();
  final descorderContoller = TextEditingController();
  final priceorderContoller = TextEditingController();
  final linkorderContoller = TextEditingController();
  final contorllerImage = Get.put(UploadImageController());

  createNewOrder() async {
    isLoading(true);
    String fileName = contorllerImage.image!.path.split('/').last;
    final response = await Api.createNewOrder(
      nameorder: nameorderContoller.text,
      descorder: descorderContoller.text,
      priceorder: priceorderContoller.text,
      linkorder: linkorderContoller.text,
      imagepath: contorllerImage.image!.path,
      fileName: fileName,
    );
    isLoading(false);
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
