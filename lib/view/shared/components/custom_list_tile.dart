import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/controller/theme/theme_controller.dart';
import 'package:sizer/sizer.dart';

class ListTileCostum extends StatelessWidget {
  final controller = Get.put(ThemeController());
  final String? title;
  final IconData? icon;
  final Widget? action;
  ListTileCostum({
    this.title,
    this.icon,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
        color: controller.stateTheme ? Colors.white : Colors.black,
      ),
      title: Text(
        title!,
        style: TextStyle(
          color: controller.stateTheme ? Colors.white : Colors.black,
          fontFamily: 'Lato-Regular',
          fontSize: 14.sp,
        ),
      ),
      trailing: action,
    );
  }
}
