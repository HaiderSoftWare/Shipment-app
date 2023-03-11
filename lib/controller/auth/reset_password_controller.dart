import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/service/api.dart';
import 'package:ship_app/view/pages/auth/login/login_screen.dart';

import 'forget_password_contoller.dart';

class ResetPasswordContoller extends GetxController {
  RxBool isLoading = false.obs;

  final newPasswordContoller = TextEditingController();

  final contoller = Get.put(ForgetPasswordController());

  resetPasswordUser() async {
    final response = await Api.resetPassword(
      phone: contoller.phoneContoller.text,
      newpassword: newPasswordContoller.text,
      otp: contoller.otp,
    );
    if (response.data['success'] == true) {
      isLoading(false);
      print('response ===== ${response.data}');
      Get.to(LoginScreen());
    }
  }
}




  // Dio dio = Dio();
  // Future<ResetPasswordModel> resetPasswordUser() async {
    // print(contoller.phoneContoller.text +
    //     newPasswordContoller.text +
    //     contollerLogin.otpController.text);
  //   try {
  //     final response = await dio.post(newPasswordUrl,
  //         options: Options(headers: {
  //           'Accept': 'application/json',
  //         }),
  //         data: {
  //           'phone': contoller.phoneContoller.text,
  //           'new_password': newPasswordContoller.text,
  //           'otp': contollerLogin.otpController.text,
  //         });

  //     print(response.data);

  //     return ResetPasswordModel.fromJson(response.data);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }