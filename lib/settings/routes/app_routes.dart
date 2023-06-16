import 'package:get/get.dart';

class AppRoutes {
  static AppRoutes getInstance() {
    return Get.find<AppRoutes>();
  }

  getTo({required String routes, dynamic arguments}) {
    Get.to(routes, arguments: arguments);
  }

  getToName({required String routes, dynamic arguments}) {
    Get.toNamed(routes, arguments: arguments);
  }

  getOffAllName({required String routes, dynamic arguments}) {
    Get.offAllNamed(routes, arguments: arguments);
  }

  getOffName({required String routes, dynamic arguments}) {
    Get.offNamed(routes, arguments: arguments);
  }

  getBack({dynamic results}) {
    Get.back(result: results);
  }

}