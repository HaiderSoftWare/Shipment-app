import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ship_app/controller/auth/login_controller.dart';
import 'package:ship_app/view/shared/function/function.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/custom_button.dart';
import '../../../shared/components/custom_text_feiled.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  LoginController controller = Get.put(LoginController());
  GlobalKey<FormState> stateformr = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 6.w, right: 6.w),
        child: SingleChildScrollView(
          child: Form(
            key: stateformr,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Lottie.asset('asset/lottile/logo.json'),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
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
                  height: 3.h,
                ),
                Text(
                  'Phone',
                  style: TextStyle(fontSize: 13.sp, color: Colors.black),
                ),
                SizedBox(height: 1.h),
                TextFromFeiled(
                  hinttext: '07828883703',
                  controller: controller.phoneContoller,
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
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.offNamed('forget');
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(fontSize: 11.sp, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(() {
                  if (controller.isLoading.value == true) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Custom_Button(
                      text: 'Login',
                      onpress: () {
                        if (stateformr.currentState!.validate()) {
                          controller.loginUser();
                        }
                      },
                    );
                  }
                }),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.toNamed('signup');
                      },
                      child: Text(
                        'Don’t have an ccount? Sign up',
                        style: TextStyle(fontSize: 11.sp, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
