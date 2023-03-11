import 'package:dio/dio.dart';
import 'package:get/get.dart' as GET;
import 'package:ship_app/view/shared/route/api_path.dart';

import '../controller/auth/login_controller.dart';

class Api {
  static final contorllerLogin = GET.Get.put(LoginController());
  static final dio = Dio();
  static var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${contorllerLogin.token}'
  };

  static Future<Response> getOrders() async {
    return dio.get(
      orderUrl,
      options: Options(
        headers: headers,
      ),
    );
  } //end of getOrder

  static Future<Response> getOneOrder({int? orderid}) async {
    return dio.get(
      '$orderUrl/$orderid',
      options: Options(
        headers: headers,
      ),
    );
  } //end of getOneOrder

  static Future<Response> createNewOrder({
    String? nameorder,
    String? descorder,
    String? linkorder,
    String? priceorder,
    String? imageoder,
    String? imagepath,
    String? fileName,
  }) async {
    FormData formData = FormData.fromMap(
      {
        'product_name': nameorder,
        'product_descr': descorder,
        'product_link': linkorder,
        'price': priceorder,
        'product_image': await MultipartFile.fromFile(
          imagepath.toString(),
          filename: fileName,
        ),
      },
    );
    return dio.post(
      orderUrl,
      options: Options(
        headers: headers,
      ),
      data: formData,
    );
  } //end of createNewOrder

  static Future<Response> updateOrder({int? index}) async {
    return dio.put(
      '$orderUrl/$index',
      options: Options(
        headers: headers,
      ),
      data: {
        'status': 'canceled',
      },
    );
  } //end of updateOrder

} //end of api

