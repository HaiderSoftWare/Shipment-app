import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:ship_app/controller/order/dareil/detail_order_controller.dart';
import 'package:ship_app/view/shared/components/custom_card.dart';
import 'package:ship_app/view/shared/constant/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/order/update/update_order_controller.dart';
import '../../../controller/theme/theme_controller.dart';
import '../../shared/components/custom_button.dart';
import '../../shared/components/richtextbulid.dart';
import '../bottom navigation/bottom_navigation.dart';

class DetailScreen extends StatelessWidget {
  final controllertheme = Get.put(ThemeController());
  var data;
  DetailScreen({this.data});

  final contollerUpdate = Get.put(UpdateOrderController());
  final controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: controllertheme.stateTheme
          ? ColorSelect.KPrimary
          : ColorSelect.cwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Order Details',
          style: TextStyle(
            fontFamily: 'Lato-Bold',
            fontSize: 18.sp,
            color: primaryKD,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 1.h, left: 6.w, right: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (value) {
                  controller.changeIndex(value);
                },
                itemCount: 3,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(left: 2.w, right: 2.w),
                  child: CostumCard(
                    image: data.items[0].itemLink,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            // ponit
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(right: 5),
                  height: 10,
                  width: controller.currentPage == index ? 10 : 10,
                  decoration: BoxDecoration(
                    color: controller.currentPage == index
                        ? primaryKD
                        : const Color(0xFFD8D8D8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.h),

            Richtextbulid(
              firstext: 'Order : ',
              lastext: data.items[0].id.toString(),
            ),
            SizedBox(height: 1.h),
            Richtextbulid(
              firstext: 'Date:',
              lastext: data.createdAt.toString().substring(0, 19),
            ),

            SizedBox(height: 1.h),
            Richtextbulid(
              firstext: 'Price : ',
              lastext: '${data.items[0].price}\$',
            ),
            SizedBox(height: 1.h),
            Expanded(
              flex: 1,
              child: Richtextbulid(
                firstext: 'Status : ',
                lastext: data.history[0].status.toString(),
              ),
            ),

            SizedBox(height: 1.h),
            Custom_Button(
              text: 'Cancel',
              onpress: () {
                PanaraInfoDialog.show(
                  context,
                  title: "Message",
                  message: "Status Change Successfully ",
                  buttonText: "Okay",

                  noImage: true,

                  onTapDismiss: () {
                    Get.offAll(BottomNavigation());
                  },
                  panaraDialogType: PanaraDialogType.success,
                  barrierDismissible:
                      false, // optional parameter (default is true)
                );
                contollerUpdate.updateStatusOrder();
              },
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
