import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/controller/theme/theme_controller.dart';
import 'package:ship_app/view/pages/auth/login/login_screen.dart';
import 'package:ship_app/view/shared/constant/colors.dart';

import 'package:sizer/sizer.dart';

import 'controller/middleware/service.dart';

import 'view/shared/route/route_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await onInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controllerTheme = Get.put(ThemeController());
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shipment app',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                    color: controllerTheme.stateTheme
                        ? ColorSelect.cwhite
                        : primaryKD),
              ),
            ),
            // initialRoute: '/onborading',
            getPages: routePage(),
            home: LoginScreen() //const OnboardingExample(),
            );
      },
    );
  }
}
