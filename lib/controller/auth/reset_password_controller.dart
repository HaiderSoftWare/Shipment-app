import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/controller/auth/otp_login_controller.dart';
import 'package:ship_app/view/pages/auth/login/login_screen.dart';

import '../../view/shared/route/api_path.dart';
import '../../service/service.dart';
import 'forget_password_contoller.dart';

class ResetPasswordContoller extends GetxController {
  // GlobalKey<FormFieldState> stateformre =
  //     GlobalKey(debugLabel: 'GlobalFormKey #reset ');
  Service service = Service();
  RxBool isLoading = false.obs;

  final newPasswordContoller = TextEditingController();

  final contoller = Get.put(ForgetPasswordController());

  final contollerLogin = Get.put(OTPController());

  resetPasswordUser() {
    service.postMethod(
      url: newPasswordUrl,
      data: {
        'phone': contoller.phoneContoller.text,
        'new_password': newPasswordContoller.text,
        'otp': contollerLogin.otp,
      },
      //routePage: '/login',
      loading: isLoading,
    );
  }

  handleField() {
    // if (stateformre.currentState!.validate()) {
    resetPasswordUser();
    Get.to(LoginScreen());
    //}
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