import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/view/shared/route/api_path.dart';

import '../../service/service.dart';

class RegisterController extends GetxController {
  Service service = Service();
  RxBool isLoading = false.obs;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();

  registerUser() {
    service.postMethod(
      url: registerUrl,
      data: {
        'name': nameController.text,
        'phone': phoneController.text,
        'password': passwordController.text,
        'c_password': cPasswordController.text,
        'user_type': 'customer',
      },
      routePage: 'otpsignup',
      loading: isLoading,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    cPasswordController.dispose();
    super.dispose();
  }

  handleField() {
    if (passwordController.text != cPasswordController.text) {
      Get.snackbar('Wrong', 'Password does not match. Please re-type again.',
          snackPosition: SnackPosition.BOTTOM);
    } else //if (stateformr.currentState!.validate()) {
    {
      registerUser();
    }
  }
}















    // token = response.data['token'];
      // services.sharedPreferences.setInt('user_id', response.data['user']['id']);
      // services.sharedPreferences
      //     .setString('name', response.data['user']['first_name']);