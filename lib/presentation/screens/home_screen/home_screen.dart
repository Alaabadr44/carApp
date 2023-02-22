// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/home/home_res_model.dart';
import 'package:flutter_application_1/presentation/screens/home_screen/home_controller.dart';
import 'package:flutter_application_1/presentation/screens/home_screen/widgets/widgets.dart';
import 'package:flutter_application_1/style/dimisions.dart';
import 'package:get/get.dart';

import '../../../configuration/navigation/AppRoutes.dart';
import '../../../data/base/ui_state_view_mixin.dart';

class HomeScreen extends GetView<HomeController> with UiStateViewMixin {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
            () => handleUiState<HomeResModel>(controller.homeState, (model) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeScreenAppBar(model.data.notificationCount),
                        CarsStoryBar(model.data.stories),
                        HomeImageBar(imagePath: model.data.banar),
                        SizedBox(height: Dimisions.sbhHigh10),
                        const HomeSearchBar(),
                        SizedBox(height: Dimisions.sbhHigh10),
                        const HomeOptionsBar(),
                        GridCarsView(
                          model.data.cars,
                          onCarItemPress: (car) {
                            Get.toNamed(Routes.CarDetailScreen,
                                arguments: {"car": car});
                          },
                        ),
                        HomeImageBar(imagePath: model.data.footer),
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}
