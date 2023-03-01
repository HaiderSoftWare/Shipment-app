import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ship_app/view/shared/route/api_path.dart';

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

  Dio dio = Dio();
  Future<Order> getOrders() async {
    isLoading(true);
    try {
      final response = await dio.get(
        getOrdersUrl,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${contorllerLogin.token}'
          },
        ),
      );

      orders.value = Order.fromJson(response.data);

      isLoading(false);

      return Order.fromJson(response.data);
    } catch (e) {
      isLoading(false);

      throw Exception(e.toString());
    }
  }
}
