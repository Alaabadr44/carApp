import 'package:get/instance_manager.dart';

import '../../data/repositories/home/home_repository.dart';
import '../../networking/dio_client.dart';
import '../../networking/networking_app_service.dart';
import '../../presentation/screens/home_screen/home_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    //dio
    Get.lazyPut(() => DioClient.instance, fenix: true);
    //net work service
    Get.lazyPut(() => NetworkingAppService(), fenix: true);

    //repo
    Get.lazyPut(() => HomeRepository(Get.find()));

    // controllers
    Get.lazyPut(() => HomeController(Get.find()));
  }
}
