import 'package:dio/dio.dart';
import 'package:get/get.dart' as GET;
import 'package:ship_app/controller/auth/login_controller.dart';

import 'package:ship_app/view/shared/route/api_path.dart';

import '../controller/middleware/service.dart';

class Api {
  static SettingServices services = GET.Get.find<SettingServices>();

  static final controller = GET.Get.put(LoginController());

  static final dio = Dio();
  static var headers = {
    'Accept': 'application/json',
    'Authorization':
        'Bearer ${services.sharedPreferences.getString('login_success') ?? controller.token}'
  };

  static Future<Response> loginUser({
    String? phone,
    String? password,
  }) async {
    return dio.post(
      loginUrl,
      options: Options(
        headers: headers,
      ),
      data: {
        'phone': phone,
        'password': password,
      },
    );
  } //end of loginUser

  static Future<Response> resetPassword({
    String? phone,
    String? newpassword,
    String? otp,
  }) async {
    return dio.post(
      newPasswordUrl,
      options: Options(
        headers: headers,
      ),
      data: {
        'phone': phone,
        'new_password': newpassword,
        'otp': otp,
      },
    );
  } //end of resetPassword

  static Future<Response> registerUser(
      {String? name,
      String? phone,
      String? password,
      String? cpassword}) async {
    return dio.post(
      registerUrl,
      options: Options(
        headers: headers,
      ),
      data: {
        'name': name,
        'phone': phone,
        'password': password,
        'c_password': cpassword,
        'user_type': 'customer',
      },
    );
  } //end of registerUser

  static Future<Response> verifyUser({
    String? phone,
    String? otp,
  }) async {
    return dio.post(verifyUrl,
        options: Options(
          headers: headers,
        ),
        data: {
          'phone': phone,
          'otp': otp,
        });
  } //end of verifyUser

  static Future<Response> forgetPasswordUser({
    String? phone,
  }) async {
    return dio.post(
      forgetPasswordUrl,
      options: Options(
        headers: headers,
      ),
      data: {
        'phone': phone,
      },
    );
  } //end of forgetPasswordUser

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

