import 'package:get/instance_manager.dart';

import '../order/get order/get_one_oder_controller.dart';
import '../order/get order/orders_controller.dart';
import '../order/update/update_order_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetOneOrderController());
    Get.lazyPut(() => UpdateOrderController());
    Get.lazyPut(() => GetOrdersController());
  }
}
