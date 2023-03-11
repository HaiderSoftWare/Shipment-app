import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ship_app/view/shared/route/api_path.dart';

import '../../service/service.dart';

class ForgetPasswordController extends GetxController {
  //GlobalKey<FormFieldState> stateformf =
  // GlobalKey(debugLabel: 'GlobalFormKey #forget ');
  Service service = Service();
  RxBool isLoading = false.obs;
  TextEditingController phoneContoller = TextEditingController();

  forgetPasswordUser() {
    service.postMethod(
      url: forgetPasswordUrl,
      data: {
        'phone': phoneContoller.text,
      },
      routePage: 'otp',
      loading: isLoading,
    );
  }

  handleField() {
    // if (stateformf.currentState!.validate()) {
    forgetPasswordUser();
    //}
  }
  // @override
  // void dispose() {
  //   phoneContoller.dispose();
  //   super.dispose();
  // }
}

//  Dio dio = Dio();
//   Future<ForgetPasswordModel> forgetPasswordUser() async {
//     try {
//       final response = await dio.post(forgetPasswordUrl,
//           options: Options(headers: {
//             'Accept': 'application/json',
//           }),
//           data: {
//             'phone': phoneContoller.text,
//           });

//       print(response.data);

//       return ForgetPasswordModel.fromJson(response.data);
//     } catch (e) {
//       throw Exception(e.toString());
//     }