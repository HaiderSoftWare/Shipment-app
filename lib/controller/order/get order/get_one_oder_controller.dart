import 'package:get/get.dart';
import 'package:ship_app/service/api.dart';

import '../../../model/order/get_one_order_model.dart';
import '../../auth/login_controller.dart';

class GetOneOrderController extends GetxController {
  final contorllerLogin = Get.put(LoginController());

  RxBool isLoading = false.obs;

  int? orderid;

  var orders = GetOneOrderModel().obs;

  @override
  void onInit() {
    getOneOrder();
    super.onInit();
  }

  void getOneOrder() async {
    isLoading(true);
    final response = await Api.getOneOrder(orderid: orderid);
    orders.value = GetOneOrderModel.fromJson(response.data);
    isLoading(false);
  }
}
