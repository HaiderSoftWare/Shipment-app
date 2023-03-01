import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ship_app/controller/auth/register_controller.dart';
import 'package:ship_app/view/pages/auth/login/login_screen.dart';
import 'package:ship_app/view/shared/function/function.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/custom_button.dart';
import '../../../shared/components/custom_text_feiled.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final controller = Get.put(RegisterController());
  GlobalKey<FormState> stateformr = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 10.h,
          left: 6.w,
          right: 6.w,
        ),
        child: Form(
          key: stateformr,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Lottie.asset(
                    'asset/lottile/logo.json',
                    height: 22.h,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Signup',
                        style: TextStyle(
                          fontFamily: 'Lato-Bold',
                          fontSize: 26.sp,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Name',
                  style: TextStyle(fontSize: 13.sp, color: Colors.black),
                ),
                SizedBox(height: 1.h),
                TextFromFeiled(
                  hinttext: 'Haider',
                  controller: controller.nameController,
                  obscureText: false,
                  keyborad: TextInputType.number,
                  validatorf: (text) => vinputname(text),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Phone',
                  style: TextStyle(fontSize: 13.sp, color: Colors.black),
                ),
                SizedBox(height: 1.h),
                TextFromFeiled(
                  hinttext: '07828883703',
                  controller: controller.phoneController,
                  obscureText: false,
                  keyborad: TextInputType.number,
                  validatorf: (text) => vinputphne(text),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Password',
                  style: TextStyle(fontSize: 13.sp, color: Colors.black),
                ),
                SizedBox(height: 1.h),
                TextFromFeiled(
                  hinttext: '**************',
                  controller: controller.passwordController,
                  obscureText: true,
                  // keyborad: TextInputType.visiblePassword,
                  validatorf: (text) => vinputpassword(text),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Confirm Password',
                  style: TextStyle(fontSize: 13.sp, color: Colors.black),
                ),
                const SizedBox(height: 6),
                TextFromFeiled(
                  hinttext: '**************',
                  controller: controller.cPasswordController,
                  obscureText: true,
                  keyborad: TextInputType.visiblePassword,
                  validatorf: (text) => vinputpassword(text),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(() {
                  if (controller.isLoading.value == true) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Custom_Button(
                      text: 'Sign up',
                      onpress: () {
                        if (stateformr.currentState!.validate()) {
                          controller.registerUser();
                        }
                      },
                    );
                  }
                }),
                SizedBox(
                  height: 0.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: TextButton(
                        onPressed: () {},
                        child: InkWell(
                          onTap: () {
                            Get.to(LoginScreen());
                          },
                          child: Text(
                            'Do you have an ccount? Login',
                            style:
                                TextStyle(fontSize: 11.sp, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
