import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:ship_app/controller/order/get%20order/orders_controller.dart';
import 'package:ship_app/controller/order/new%20order/new_order_controller.dart';

import 'package:ship_app/controller/order/new%20order/upload_image_controller.dart';
import 'package:ship_app/view/shared/constant/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/theme/theme_controller.dart';
import '../../shared/components/choose_color.dart';
import '../../shared/components/custom_button.dart';
import '../../shared/components/custom_text_feiled.dart';
import '../../shared/function/function.dart';
import '../bottom navigation/bottom_navigation.dart';

class CreateOrderScreen extends StatelessWidget {
  CreateOrderScreen({super.key});

  final GlobalKey<FormState> globalKey = GlobalKey();
  final controllerTheme = Get.put(ThemeController());

  final controllerOrder = Get.put(NewOrderController());
  final controllerOrders = Get.put(GetOrdersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: controllerTheme.stateTheme
          ? ColorSelect.KPrimary
          : ColorSelect.cwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
            child: Form(
              key: globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create New Order',
                    style: TextStyle(
                      fontFamily: 'Lato-Bold',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: controllerTheme.stateTheme
                          ? Colors.white70
                          : primaryKD,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: controllerTheme.stateTheme
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  TextFromFeiled(
                    hinttext: '1200',
                    controller: controllerOrder.priceorderContoller,
                    obscureText: false,
                    keyborad: TextInputType.text,
                    validatorf: (text) => vinputprice(text),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Product Name',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: controllerTheme.stateTheme
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  TextFromFeiled(
                    hinttext: 'Hyperx headset cloud gaming',
                    controller: controllerOrder.nameorderContoller,
                    obscureText: false,
                    keyborad: TextInputType.number,
                    validatorf: (text) => vinputname(text),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: controllerTheme.stateTheme
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  TextFromFeiled(
                    maxline: 4,
                    maxlength: 160,
                    hinttext:
                        'BENGOO G9000 Stereo Gaming Headset for PS4 PC Xbox One PS5 Controller, Noise Cancelling Over Ear Headphones with Mic, LED Light, Bass Surround, Soft Memory good',
                    controller: controllerOrder.descorderContoller,
                    obscureText: false,
                    keyborad: TextInputType.text,
                    validatorf: (text) => vinputname(text),
                  ),
                  Text(
                    'Link',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: controllerTheme.stateTheme
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  TextFromFeiled(
                    hinttext: 'https://www.google.com/maps/place/iraq',
                    controller: controllerOrder.linkorderContoller,
                    obscureText: false,
                    keyborad: TextInputType.url,
                    validatorf: (text) => vinputname(text),
                  ),
                  GetBuilder(
                    init: UploadImageController(),
                    builder: (controller) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              controller.uploadImage();
                            },
                            child: Text(
                              'Upload Image',
                              style: TextStyle(
                                fontFamily: 'Lato-Regular',
                                fontSize: 12.sp,
                                color: controllerTheme.stateTheme
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          handelingImage(controller),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 2.h),
                  chooseColor(),
                  SizedBox(height: 2.h),
                  Custom_Button(
                    text: 'Create',
                    onpress: () {
                      if (globalKey.currentState!.validate()) {
                        PanaraInfoDialog.show(
                          context,
                          title: "Message",
                          message: "Order Create Successfully ",
                          buttonText: "Okay",
                          noImage: true,
                          onTapDismiss: () {
                            controllerOrders.getOrders();
                            Get.offAll(BottomNavigation());
                          },
                          panaraDialogType: PanaraDialogType.success,
                          barrierDismissible:
                              false, // optional parameter (default is true)
                        );
                        controllerOrder.newOrder();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //--- handel image display

  handelingImage(UploadImageController controller) {
    return controller.image == null
        ? Row(
            children: const [],
          )
        : Padding(
            padding: const EdgeInsets.only(top: 6, right: 8, left: 8),
            child: Card(
              color: secondKD,
              margin: const EdgeInsets.symmetric(vertical: 7),
              child: ListTile(
                dense: false,
                leading: Image.file(
                  File(controller.image!.path),
                ),
                title: Text(
                  controller.image!.name.toString(),
                ),
                trailing: IconButton(
                  onPressed: () {
                    controller.removeImage();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          );
  }
}
