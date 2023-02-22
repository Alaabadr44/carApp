import 'package:get/get.dart';

import '../../presentation/screens/home_screen/home_controller.dart';

class PagesBinding {
  static BindingsBuilder homeBinding() {
    return BindingsBuilder(() {
      Get.lazyPut(() => HomeController(Get.find()));
    });
  }
}
