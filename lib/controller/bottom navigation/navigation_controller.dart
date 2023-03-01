import 'package:get/get.dart';

class NavigationController extends GetxController {
  int index = 0;

  void changeIndex(int value) {
    index = value;
    update();
  }
}
