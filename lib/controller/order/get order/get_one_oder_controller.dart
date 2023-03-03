import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ship_app/view/shared/route/api_path.dart';

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

  Dio dio = Dio();

  Future<GetOneOrderModel> getOneOrder() async {
    isLoading(true);

    try {
      final response = await dio.get(
        '$getOneOrdersUrl/$orderid',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${contorllerLogin.token}'
          },
        ),
      );
      orders.value = GetOneOrderModel.fromJson(response.data);

      isLoading(false);

      return GetOneOrderModel.fromJson(response.data);
    } catch (e) {
      isLoading(false);

      throw Exception(e.toString());
    }
  }
}
