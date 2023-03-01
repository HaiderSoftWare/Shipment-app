import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/controller/theme/theme_controller.dart';
import 'package:ship_app/view/shared/constant/colors.dart';

class TextFromFeiled extends StatelessWidget {
  final controllerTheme = Get.put(ThemeController());
  String? hinttext;
  final controller;
  final validatorf;
  final obscureText;
  int? maxline;
  int? maxlength;

  TextInputType? keyborad;

  TextFromFeiled(
      {super.key,
      this.maxline,
      required this.hinttext,
      required this.controller,
      required this.validatorf,
      this.keyborad,
      this.maxlength,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        style: TextStyle(
            color: controllerTheme.stateTheme ? Colors.black : Colors.black),

        //autovalidateMode: AutovalidateMode.always,
        maxLines: maxline == null ? 1 : 4,
        maxLength: maxlength,
        obscureText: obscureText,
        validator: validatorf,
        textAlign: TextAlign.start,
        controller: controller,
        keyboardType: keyborad,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(
            color: controllerTheme.stateTheme ? Colors.grey : Colors.black54,
          ),
          hintTextDirection: TextDirection.ltr,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: primaryKD),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              color: ColorSelect.cgray,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: primaryKD),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              color: primaryKD,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: primaryKD),
          ),
        ),
      ),
    );
  }
}
