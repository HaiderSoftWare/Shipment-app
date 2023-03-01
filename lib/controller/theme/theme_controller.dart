import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool stateTheme = false;
  void changeTheme() {
    stateTheme = !stateTheme;
    update();
  }
}
