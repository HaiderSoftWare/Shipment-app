import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/controller/auth/forget_password_contoller.dart';
import 'package:ship_app/view/shared/route/api_path.dart';

import '../../model/auth/forget_password_model.dart';

class OTPController extends GetxController {
  final controller = Get.put(ForgetPasswordController());
  // Service service = Service();
  // final controller = Get.put(ForgetPasswordController());
  final otpController = TextEditingController();
  String? otp;

  Dio dio = Dio();
  Future<ForgetPasswordModel> otpUserLogin() async {
    try {
      final response = await dio.post(forgetPasswordUrl,
          options: Options(headers: {
            'Accept': 'application/json',
          }),
          data: {
            'phone': controller.phoneContoller.text,
            'otp': otpController.text,
          });
      otp = response.data['data']['otp'];
      if (response.data['success'] == true) {
        Get.toNamed('reset');
      }
      print(response.data);

      return ForgetPasswordModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
