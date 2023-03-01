import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ship_app/controller/middleware/service.dart';

class MyMiddleWare extends GetMiddleware {
  SettingServices services = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (services.sharedPreferences.getString('login_success') != null) {
      return const RouteSettings(name: '/navi');
    }
    return null;
  }
}
