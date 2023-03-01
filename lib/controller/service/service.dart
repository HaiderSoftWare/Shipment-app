import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../middleware/service.dart';

class Service {
  Dio dio = Dio();
  SettingServices services = Get.find<SettingServices>();

  postMethod({
    required String url,
    required dynamic data,
    Map<String, dynamic>? headers,
    String? routePage,
    required RxBool loading,
  }) async {
    loading(true);
    try {
      final response = await dio.post(url,
          options: Options(
            headers: headers,
          ),
          data: data);

      if (response.data['success'] == true) {
        Get.toNamed(routePage!);
      }
      loading(false);
      print(response.data);
      return response.data;
    } catch (e) {
      loading(false);
      Get.snackbar(
        'Error',
        'The data entered is incorrect',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
