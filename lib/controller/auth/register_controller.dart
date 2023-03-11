import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/service/api.dart';
import 'package:ship_app/view/pages/auth/otp/otp_signup_screen.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();

  registerUser() async {
    final response = await Api.registerUser(
      name: nameController.text,
      phone: phoneController.text,
      password: passwordController.text,
      cpassword: cPasswordController.text,
    );
    if (response.data['success'] == true) {
      Get.to(const OTPSignUpScreen());
    }
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