import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/service/api.dart';

import '../middleware/service.dart';

class LoginController extends GetxController {
  final phoneContoller = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  SettingServices services = Get.find<SettingServices>();
  String? token;

  loginUser() async {
    try {
      isLoading(true);
      final response = await Api.loginUser(
          phone: phoneContoller.text, password: passwordController.text);

      token = response.data['data']['token'];
      if (response.data['success'] == true) {
        isLoading(false);
        print('TOKEN ======= $token');
        services.sharedPreferences.setString(
          'login_success',
          token!,
        );
        Get.toNamed('navi');
      }
    } catch (e) {
      isLoading(false);
      Get.snackbar(
        'Error',
        'The data entered is incorrect',
        snackPosition: SnackPosition.BOTTOM,
      );
      throw Exception(e.toString());
    }
  }

  @override
  void dispose() {
    phoneContoller.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
