import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ship_app/service/api.dart';
import 'package:ship_app/view/pages/auth/otp/otp_login_screen.dart';

class ForgetPasswordController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController phoneContoller = TextEditingController();

  String? otp;

  forgetPasswordUser() async {
    isLoading(true);
    final response = await Api.forgetPasswordUser(phone: phoneContoller.text);
    isLoading(false);
    if (response.data['success'] == true) {
      otp = response.data['data']['otp'];
      print('otp ======= $otp');
      Get.to(OTPLoginScreen());
    }
  }

  handleField() {
    // if (stateformf.currentState!.validate()) {
    forgetPasswordUser();
    //}
  }
}
