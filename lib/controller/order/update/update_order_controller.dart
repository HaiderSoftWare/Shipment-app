import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ship_app/model/order/updata_order_model.dart';
import 'package:ship_app/view/shared/route/api_path.dart';

import '../../middleware/service.dart';

class UpdateOrderController extends GetxController {
  SettingServices services = Get.find<SettingServices>();

  int? index;
  Dio dio = Dio();
  Future<UpdataOrderModer> updateStatusOrder() async {
    try {
      final response = await dio.put(
        '$updateorderUrl/$index',
        options: Options(headers: {
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${services.sharedPreferences.getString('login_success')}'
        }),
        data: {
          'status': 'canceled',
        },
      );

      print(response.data);

      return UpdataOrderModer.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
