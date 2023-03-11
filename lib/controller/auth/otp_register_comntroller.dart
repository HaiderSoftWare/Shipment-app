import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/controller/auth/register_controller.dart';
import 'package:ship_app/service/api.dart';
import 'package:ship_app/view/pages/auth/login/login_screen.dart';

class OTPRegisterController extends GetxController {
  final controllerRegister = Get.put(RegisterController());
  final otpController = TextEditingController();

  verifyUser() async {
    final response = await Api.verifyUser(
      phone: controllerRegister.phoneController.text,
      otp: otpController.text,
    );
    if (response.data['success'] == true) {
      Get.to(LoginScreen());
    }
  }
}
