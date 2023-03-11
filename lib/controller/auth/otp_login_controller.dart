import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/controller/auth/forget_password_contoller.dart';

import '../../service/api.dart';
import '../../view/pages/auth/reset password/reset_screen.dart';

class OTPController extends GetxController {
  final controller = Get.put(ForgetPasswordController());
  final otpController = TextEditingController();

  verifyUserLogin() async {
    final response = await Api.verifyUser(
      phone: controller.phoneContoller.text,
      otp: otpController.text,
    );
    if (response.data['success'] == true) {
      print('=========== ${response.data}');
      Get.to(ResetPasswordScreen());
    }
  }
}
