import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_app/controller/bottom%20navigation/navigation_controller.dart';
import 'package:ship_app/controller/theme/theme_controller.dart';
import 'package:ship_app/view/pages/order/order_screen.dart';
import 'package:ship_app/view/pages/setting/setting_screen.dart';
import 'package:ship_app/view/shared/constant/colors.dart';

import '../order/new_order_screen.dart';
import '../notifcation/notification_screen.dart';

class BottomNavigation extends StatelessWidget {
  List<Widget> pages = [
    OrderScreen(),
    CreateOrderScreen(),
    NotificationScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ThemeController(),
      builder: (controllert) {
        return MaterialApp(
          theme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor:
                  controllert.stateTheme ? ColorSelect.KPrimary : Colors.white,
              elevation: 0,
              selectedIconTheme: IconThemeData(
                color: primaryKD,
              ),
              selectedItemColor: Colors.black87,
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: GetBuilder<NavigationController>(
            init: NavigationController(),
            builder: (controller) {
              return Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  unselectedLabelStyle: const TextStyle(color: Colors.black),
                  selectedLabelStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: primaryKD,
                  currentIndex: controller.index,
                  onTap: (value) {
                    controller.changeIndex(value);
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.delivery_dining_outlined),
                      label: 'Order',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.new_label_rounded),
                      label: 'New Order',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.notifications_active_outlined),
                      label: 'Notification',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Setting',
                    ),
                  ],
                ),
                body: pages[controller.index],
              );
            },
          ),
        );
      },
    );
  }
}
