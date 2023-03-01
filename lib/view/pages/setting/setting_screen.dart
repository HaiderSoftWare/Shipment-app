import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/controller/theme/theme_controller.dart';
import 'package:ship_app/view/pages/auth/login/login_screen.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/custom_list_tile.dart';
import '../../shared/constant/colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ThemeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor:
              controller.stateTheme ? ColorSelect.KPrimary : ColorSelect.cwhite,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Haider Majid',
                      style: TextStyle(
                        color: controller.stateTheme ? Colors.white : primaryKD,
                        fontFamily: 'Lato-Bold',
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Center(
                    child: Text(
                      '07828883703',
                      style: TextStyle(
                        color:
                            controller.stateTheme ? Colors.white : Colors.grey,
                        fontFamily: 'Lato-Regular',
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Center(
                    child: Container(
                      width: 32.w,
                      height: 4.5.h,
                      decoration: BoxDecoration(
                        color: primaryKD,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed('editprofile');
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lato-Regular',
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  GetBuilder(
                    init: ThemeController(),
                    builder: (themeController) {
                      return InkWell(
                        onTap: () {
                          themeController.changeTheme();
                        },
                        child: ListTileCostum(
                          title: 'Theme',
                          icon: Icons.dark_mode_outlined,
                          action: DayNightSwitcherIcon(
                            dayBackgroundColor: const Color(0xFFCAB19B),
                            nightBackgroundColor: ColorSelect.KPrimary,
                            isDarkModeEnabled: controller.stateTheme,
                            onStateChanged: (isDarkModeEnabled) {
                              controller.changeTheme();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(LoginScreen());
                    },
                    child: ListTileCostum(
                      title: 'Logout',
                      icon: Icons.logout_outlined,
                      action: const Text(''),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
