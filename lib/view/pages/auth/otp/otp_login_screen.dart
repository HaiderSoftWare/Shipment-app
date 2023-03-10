import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ship_app/controller/auth/reset_password_controller.dart';
import 'package:ship_app/view/shared/constant/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../../controller/auth/otp_login_controller.dart';

class OTPLoginScreen extends StatelessWidget {
  OTPLoginScreen({super.key});

  final controllerResetPassword = Get.put(ResetPasswordContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 14.h),
        child: SingleChildScrollView(
            child: GetBuilder(
          init: OTPController(),
          builder: (controller) {
            return Column(
              children: [
                Lottie.asset('asset/lottile/otp.json'),
                SizedBox(height: 3.h),
                Text(
                  'Enter the 5 numbers that were sent to your email',
                  style: TextStyle(
                    fontFamily: 'Lato-Bold',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),
                OtpTextField(
                  numberOfFields: 6,
                  enabledBorderColor: Colors.grey,
                  focusedBorderColor: primaryKD,
                  fieldWidth: 12.8.w,
                  autoFocus: true,
                  borderColor: primaryKD,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.otpController.text = verificationCode;

                    controller.verifyUserLogin();

                    //controller.otploginUser();
                    // if (controller.otp == verificationCode) {
                    //   Get.toNamed('reset');
                    // } else {
                    //   showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return const AlertDialog(
                    //         title: Text("Verification Code"),
                    //         content: Text('This OTP is wrong'),
                    //       );
                    //     },
                    //   );
                    // }
                  }, // end onSubmit
                ),
              ],
            );
          },
        )),
      ),
    );
  }
}
