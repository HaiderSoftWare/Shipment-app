import 'package:get/get.dart';
import 'package:ship_app/service/api.dart';

class UpdateOrderController extends GetxController {
  int? index;

  void updateOrder() {
    final response = Api.updateOrder(index: index);
  }
}
