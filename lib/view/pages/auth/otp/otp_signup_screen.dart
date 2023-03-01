import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ship_app/controller/auth/otp_register_comntroller.dart';
import 'package:ship_app/view/shared/constant/colors.dart';
import 'package:sizer/sizer.dart';

class OTPSignUpScreen extends StatelessWidget {
  const OTPSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 6.w, right: 6.w),
        child: GetBuilder(
          init: OTPRegisterController(),
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    controller.otpUserRegister();
                  }, // end onSubmit
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
