import 'package:get/get.dart';
import 'package:ship_app/service/api.dart';

import '../../../model/order/get_orders_model.dart';
import '../../auth/login_controller.dart';
import '../../middleware/service.dart';

class GetOrdersController extends GetxController {
  final contorllerLogin = Get.put(LoginController());
  SettingServices services = Get.find<SettingServices>();

  RxBool isLoading = false.obs;

  var orders = Order().obs;

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

  Future<void> getOrders() async {
    isLoading(true);
    final response = await Api.getOrders();
    orders.value = Order.fromJson(response.data);
    isLoading(false);
  }
}
