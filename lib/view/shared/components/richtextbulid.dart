import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/controller/theme/theme_controller.dart';
import 'package:sizer/sizer.dart';

import '../constant/colors.dart';

class Richtextbulid extends StatelessWidget {
  final controller = Get.put(ThemeController());
  final String? firstext;
  final String? lastext;
  Richtextbulid({
    this.firstext,
    this.lastext,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(),
        children: [
          TextSpan(
            text: firstext,
            style: TextStyle(
              color: primaryKD,
              fontFamily: 'Lato-Bold',
              fontSize: 15.sp,
            ),
          ),
          TextSpan(
            text: lastext!,
            style: TextStyle(
              color: controller.stateTheme ? ColorSelect.cwhite : Colors.black,
              fontFamily: 'Lato-Bold',
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}
