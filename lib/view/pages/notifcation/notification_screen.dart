import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/theme/theme_controller.dart';
import '../../shared/constant/colors.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final controllerTheme = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: controllerTheme.stateTheme
          ? ColorSelect.KPrimary
          : ColorSelect.cwhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: Text(
                  'Notification',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        controllerTheme.stateTheme ? Colors.white70 : primaryKD,
                    fontFamily: 'Lato-Bold',
                    fontSize: 20.sp,
                  ),
                ),
              ),
              // Expanded(
              //   child: itemCard(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
