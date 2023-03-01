import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ship_app/controller/auth/forget_password_contoller.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/custom_button.dart';
import '../../../shared/components/custom_text_feiled.dart';
import '../../../shared/function/function.dart';

class ForgetScreen extends StatelessWidget {
  ForgetScreen({super.key});

  final controller = Get.put(ForgetPasswordController());
  GlobalKey<FormState> stateformr = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: stateformr,
          child: Padding(
            padding: EdgeInsets.only(top: 18.h, left: 6.w, right: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please enter  phone number for the account you want to change the password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Lato-Thin',
                    fontSize: 15.sp,
                  ),
                ),
                Lottie.asset('asset/lottile/phone.json'),
                SizedBox(height: 6.h),
                Text(
                  'Phone',
                  style: TextStyle(fontSize: 13.sp, color: Colors.black),
                ),
                SizedBox(height: 1.h),
                TextFromFeiled(
                  hinttext: '07828883703',
                  controller: controller.phoneContoller,
                  obscureText: false,
                  validatorf: (text) => vinputphne(text),
                ),
                SizedBox(
                  height: 5.h,
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
