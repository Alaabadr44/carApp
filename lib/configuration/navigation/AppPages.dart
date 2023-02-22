import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../presentation/screens/detail_screen/detail_screen.dart';
import '../../presentation/screens/home_screen/home_screen.dart';
import '../binding/pages_binding.dart';
import 'AppRoutes.dart';

class AppPages {
  static const initial = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.Home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      binding: PagesBinding.homeBinding(),
    ),
    GetPage(
      name: Routes.CarDetailScreen,
      transition: Transition.fadeIn,
      page: () => CarDetailScreen(),
    ),
  ];
}
