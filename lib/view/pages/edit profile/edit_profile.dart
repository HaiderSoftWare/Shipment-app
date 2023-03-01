import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/controller/theme/theme_controller.dart';
import 'package:ship_app/view/shared/constant/colors.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/custom_button.dart';
import '../../shared/components/custom_text_feiled.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final controller = Get.put(ThemeController());

  final TextEditingController numberphone = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          controller.stateTheme ? ColorSelect.KPrimary : ColorSelect.cwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 6.w, right: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit Profile',
              style: TextStyle(
                  fontFamily: 'Lato-Bold', fontSize: 22.sp, color: primaryKD),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              'Name',
              style: TextStyle(
                fontSize: 13.sp,
                color: controller.stateTheme ? Colors.white : Colors.grey,
              ),
            ),
            SizedBox(height: 1.h),
            TextFromFeiled(
              hinttext: 'Haider Majid',
              controller: numberphone,
              obscureText: false,
              keyborad: TextInputType.number,
              validatorf: (Text) {
                if (Text.isEmpty) {
                  return '';
                }
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Phone',
              style: TextStyle(
                fontSize: 13.sp,
                color: controller.stateTheme ? Colors.white : Colors.grey,
              ),
            ),
            SizedBox(height: 1.h),
            TextFromFeiled(
              hinttext: '07828883703',
              controller: password,
              obscureText: true,
              validatorf: (Text) {
                if (Text.isEmpty) {
                  return '';
                }
              },
            ),
            SizedBox(height: 4.h),
            Custom_Button(
              text: 'Save',
              onpress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
