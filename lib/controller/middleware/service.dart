import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<SettingServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

Future onInit() async {
  await Get.putAsync(() => SettingServices().init());
}
