import 'package:get/get.dart';

class DetailController extends GetxController {
  int currentPage = 0;

  void changeIndex(int value) {
    currentPage = value;
    update();
  }
}
