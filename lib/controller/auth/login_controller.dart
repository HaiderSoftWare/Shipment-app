import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/controller/service/service.dart';
import 'package:ship_app/model/auth/login_model.dart';
import 'package:ship_app/view/shared/route/api_path.dart';

import '../middleware/service.dart';

class LoginController extends GetxController {
  //final GlobalKey<FormState> stateforml = GlobalKey();
  Service service = Service();
  TextEditingController phoneContoller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  SettingServices services = Get.find<SettingServices>();
  String? token;

  Dio dio = Dio();
  Future<LoginModel> loginUser() async {
    isLoading(true);
    try {
      final response = await dio.post(
        loginUrl,
        options: Options(headers: {
          'Accept': 'application/json',
        }),
        data: {
          'phone': phoneContoller.text,
          'password': passwordController.text,
        },
      );

      token = response.data['data']['token'];
      if (response.data['success'] == true) {
        services.sharedPreferences.setString(
          'login_success',
          token!,
        );
        Get.toNamed('navi');
      }
      isLoading(false);

      print(response.data);

      return LoginModel.fromJson(response.data);
    } catch (e) {
      isLoading(false);
      Get.snackbar(
        'Error',
        'The data entered is incorrect',
        snackPosition: SnackPosition.BOTTOM,
      );
      throw Exception(e.toString());
    }
  }
}
