// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ship_app/controller/order/get%20order/get_orders_controller.dart';
// import 'package:sizer/sizer.dart';

// import '../constant/colors.dart';

// Widget itemCard() {
//   return Padding(
//     padding: EdgeInsets.only(top: 2.h, right: 3.w, left: 3.w),
//     child: GetBuilder(
//       init: GetOrdersController(),
//       builder: (controller) {
//         return Expanded(
//           child: ListView.separated(
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return Container(
//                 width: double.infinity,
//                 height: 20.h,
//                 decoration: BoxDecoration(
//                   color: secondKD,
//                   borderRadius: BorderRadius.circular(2.w),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       top: 0.5.h, bottom: 0.5.h, right: 5.w, left: 5.w),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             controller.ordersList![index].data![index]
//                                 .items![index].itemName
//                                 .toString(),
//                             style: TextStyle(
//                               fontFamily: 'Lato-Bold',
//                               fontSize: 13.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             controller.ordersList[index].data![index]
//                                 .items![index].createdAt
//                                 .toString(),
//                             style: TextStyle(
//                               fontFamily: 'Lato-Bold',
//                               fontSize: 13.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Quantity: 50',
//                             style: TextStyle(
//                               fontFamily: 'Lato-Thinitalic',
//                               fontSize: 12.sp,
//                             ),
//                           ),
//                           Text(
//                             'Total Amount: \$  ${controller.ordersList[index].data![index].items![index].price}',
//                             style: TextStyle(
//                               fontFamily: 'Lato-Thinitalic',
//                               fontSize: 12.sp,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               Get.toNamed('dateil');
//                             },
//                             child: Text(
//                               'Datiel',
//                               style: TextStyle(
//                                 fontSize: 13.sp,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             controller.ordersList[index].data![index]
//                                 .history![index].status
//                                 .toString(),
//                             style: TextStyle(
//                                 fontFamily: 'Lato-Bold',
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 13.sp,
//                                 color: primaryKD),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             separatorBuilder: (context, index) {
//               return SizedBox(height: 1.6.h);
//             },
//             itemCount: controller.ordersList!.length,
//           ),
//         );
//       },
//     ),
//   );
// }
