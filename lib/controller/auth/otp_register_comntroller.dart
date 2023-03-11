import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/controller/auth/register_controller.dart';
import 'package:ship_app/view/pages/auth/login/login_screen.dart';
import 'package:ship_app/view/shared/route/api_path.dart';

import '../../model/auth/verify_otp_model.dart';
import '../../service/service.dart';

class OTPRegisterController extends GetxController {
  Service service = Service();
  final controllerRegister = Get.put(RegisterController());
  final otpController = TextEditingController();

  // otpUserRegister() {
  //   service.postMethod(
  //     url: verifyUrl,
  //     data: {
  //       'phone': controllerRegister.phoneController.text,
  //       'otp': otpController.text,
  //     },
  //     routePage: 'login',
  //     loading: false.obs,
  //   );
  // }

  Dio dio = Dio();
  Future<VerifyOTPModel> otpUserRegister() async {
    try {
      final response = await dio.post(verifyUrl,
          options: Options(headers: {
            'Accept': 'application/json',
          }),
          data: {
            'phone': controllerRegister.phoneController.text,
            'otp': otpController.text,
          });

      if (response.data['success'] == true) {
        Get.to(LoginScreen());
      }

      print(response.data);

      return VerifyOTPModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
