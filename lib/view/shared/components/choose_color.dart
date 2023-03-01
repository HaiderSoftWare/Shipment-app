import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ship_app/controller/order/new%20order/info_order_controller.dart';
import 'package:ship_app/controller/theme/theme_controller.dart';
import 'package:ship_app/view/shared/constant/colors.dart';
import 'package:sizer/sizer.dart';

final controllerTheme = Get.put(ThemeController());
Widget chooseColor() {
  return GetBuilder<InfoOrderController>(
    init: InfoOrderController(),
    builder: (controller) {
      return Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Count',
                style: TextStyle(
                  fontSize: 13.sp,
                  color:
                      controllerTheme.stateTheme ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 1.h),
              Container(
                width: 30.w,
                height: 5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: ColorSelect.cgray,
                  ),
                ),
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: controllerTheme.stateTheme
                              ? Colors.white
                              : Colors.black,
                        ),
                        onPressed: () {
                          controller.decrement();
                        },
                      ),
                      Text(
                        controller.count.toString(),
                        style: TextStyle(
                          fontSize: 12.9.sp,
                          color: controllerTheme.stateTheme
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: controllerTheme.stateTheme
                              ? Colors.white
                              : Colors.black,
                        ),
                        onPressed: () {
                          controller.increment();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 3.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Color',
                style: TextStyle(
                  fontSize: 13.sp,
                  color:
                      controllerTheme.stateTheme ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 1.h),
              Container(
                width: 22.w,
                height: 5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: ColorSelect.cgray,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    controller.openDialog();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: controller.mainColor,
                        radius: 1.7.h,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: controllerTheme.stateTheme
                            ? ColorSelect.cwhite
                            : Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 3.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Size',
                style: TextStyle(
                  fontSize: 13.sp,
                  color:
                      controllerTheme.stateTheme ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 1.h),
              Container(
                width: 30.w,
                height: 5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: ColorSelect.cgray,
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                        color: controllerTheme.stateTheme
                            ? Colors.white
                            : Colors.black,
                      ),
                      onPressed: () {
                        controller.decrementSize();
                      },
                    ),
                    Text(
                      controller.size.toString(),
                      style: TextStyle(
                        fontSize: 12.9.sp,
                        color: controllerTheme.stateTheme
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: controllerTheme.stateTheme
                            ? Colors.white
                            : Colors.black,
                      ),
                      onPressed: () {
                        controller.incrementSize();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
