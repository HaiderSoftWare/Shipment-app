import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:get/get.dart';
import 'package:ship_app/view/shared/constant/colors.dart';
import 'package:sizer/sizer.dart';

class InfoOrderController extends GetxController {
  int count = 1;
  int size = 20;
  ColorSwatch? tempMainColor;
  ColorSwatch? mainColor = Colors.blue;

  void openDialog() async {
    Get.defaultDialog(
      title: 'Choose Color',
      buttonColor: primaryKD,
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      textConfirm: 'Save',
      textCancel: 'Cancal',
      titleStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato-Bold',
          fontSize: 17.sp,
          color: primaryKD),
      content: SizedBox(
        height: 18.h,
        child: MaterialColorPicker(
          selectedColor: mainColor,
          allowShades: false,
          onMainColorChange: (color) {
            tempMainColor = color;
            update();
          },
        ),
      ),
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        mainColor = tempMainColor;
        Get.back();
        update();
      },
    );
  }

  void increment() {
    count++;
    update();
  }

  void decrement() {
    count--;
    update();
  }

  void incrementSize() {
    size++;
    update();
  }

  void decrementSize() {
    size--;
    update();
  }
}
