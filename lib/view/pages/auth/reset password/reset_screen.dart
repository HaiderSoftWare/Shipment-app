import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ship_app/controller/auth/reset_password_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/custom_button.dart';
import '../../../shared/components/custom_text_feiled.dart';
import '../../../shared/function/function.dart';

class ResetPasswordScreen extends StatelessWidget {
  final controller = Get.put(ResetPasswordContoller());
  GlobalKey<FormState> stateformr = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: stateformr,
          child: Padding(
            padding: EdgeInsets.only(top: 12.h, left: 6.w, right: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Reset Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Lato-Bold',
                    fontSize: 22,
                  ),
                ),
                Lottie.asset('asset/lottile/reset.json'),
                SizedBox(height: 2.h),
                Text(
                  ' New Password',
                  style: TextStyle(fontSize: 13.sp, color: Colors.black),
                ),
                SizedBox(height: 1.h),
                TextFromFeiled(
                  hinttext: 'Haider@123',
                  controller: controller.newPasswordContoller,
                  obscureText: false,
                  validatorf: (text) => vinputpassword(text),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Obx(() {
                  if (controller.isLoading.value == true) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Custom_Button(
                      text: 'Reset',
                      onpress: () {
                        if (stateformr.currentState!.validate()) {
                          controller.handleField();
                        }
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
