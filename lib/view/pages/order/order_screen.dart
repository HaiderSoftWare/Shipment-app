import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/view/pages/order/datiel_screen.dart';
import 'package:ship_app/view/shared/constant/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/order/get order/get_one_oder_controller.dart';
import '../../../controller/order/get order/get_orders_controller.dart';
import '../../../controller/order/update/update_order_controller.dart';
import '../../../controller/theme/theme_controller.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key});

  final controllerTheme = Get.put(ThemeController());

  final controlleru = Get.put(UpdateOrderController());
  final controllerOneOrder = Get.put(GetOneOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: controllerTheme.stateTheme
          ? ColorSelect.KPrimary
          : ColorSelect.cwhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 2.h, left: 4.w, right: 4.w),
          child: GetX(
            init: GetOrdersController(),
            builder: (controller) {
              return controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Orders',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: controllerTheme.stateTheme
                                ? Colors.white70
                                : primaryKD,
                            fontFamily: 'Lato-Bold',
                            fontSize: 22.sp,
                          ),
                        ),
                        SizedBox(height: 1.6.h),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                width: double.infinity,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    controllerTheme.stateTheme
                                        ? const BoxShadow(
                                            // color: Color.fromRGBO(
                                            //     149, 157, 165, 0.3),
                                            // offset: Offset(0, 0),
                                            // blurRadius: 0,
                                            )
                                        : const BoxShadow(
                                            color: Color.fromRGBO(
                                                55, 155, 255, 0.2),
                                            offset: Offset(1, 2),
                                            blurRadius: 10,
                                          ),
                                  ],
                                  color: controllerTheme.stateTheme
                                      ? Colors.white
                                      : Colors.teal[100],
                                  borderRadius: BorderRadius.circular(4.w),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 0.5.h,
                                      bottom: 0.5.h,
                                      right: 5.w,
                                      left: 5.w),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.orders.value.data![index]
                                                .items![0].itemName
                                                .toString(),
                                            style: TextStyle(
                                              fontFamily: 'Lato-Bold',
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            controller
                                                .orders.value.data![index].id
                                                .toString(),
                                            style: TextStyle(
                                              fontFamily: 'Lato-Bold',
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Quantity: 50',
                                            style: TextStyle(
                                              fontFamily: 'Lato-Thinitalic',
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Text(
                                            'Total Amount: \$  ${controller.orders.value.data![index].items![0].price}',
                                            style: TextStyle(
                                              fontFamily: 'Lato-Thinitalic',
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controllerOneOrder.orderid =
                                                  controller.orders.value
                                                      .data![index].id!;

                                              print(
                                                  '============= id ===============${controllerOneOrder.orderid}');
                                              //=======================
                                              controlleru.index = controller
                                                  .orders.value.data![index].id;

                                              controllerOneOrder.getOneOrder();
                                              Get.to(
                                                DetailScreen(
                                                    // data: controller.orders.value
                                                    //     .data![index],
                                                    ),
                                              );
                                            },
                                            child: Text(
                                              'Datiel',
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            controller.orders.value.data![index]
                                                .history![0].status
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily: 'Lato-Bold',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.sp,
                                                color:
                                                    controllerTheme.stateTheme
                                                        ? Colors.black
                                                        : primaryKD),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 1.6.h);
                            },
                            itemCount: controller.orders.value.data!.length,
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
