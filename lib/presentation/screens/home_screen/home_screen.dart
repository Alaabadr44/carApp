// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/home/home_res_model.dart';
import 'package:flutter_application_1/presentation/screens/home_screen/home_controller.dart';
import 'package:flutter_application_1/presentation/screens/home_screen/widgets/grid_cars_view_bar.dart';
import 'package:flutter_application_1/presentation/screens/home_screen/widgets/horizontal_one_image_bar.dart';
import 'package:flutter_application_1/style/colors.dart';
import 'package:flutter_application_1/style/dimisions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../configuration/navigation/AppRoutes.dart';
import '../../../data/base/ui_state_view_mixin.dart';
import '../../styled_component/reuse-widget/main_bottom.dart';
import '../../styled_component/reuse-widget/search_felid.dart';
import 'widgets/car_story_item.dart';
import 'widgets/home_screen_app_bar.dart';

class HomeScreen extends GetView<HomeController> with UiStateViewMixin {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Obx(
          () => handleUiState<HomeResModel>(
            controller.homeState,
            (model) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeScreenAppBar(model.data.notificationCount),
                    SizedBox(
                      height: 150.h,
                      width: double.infinity,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding:
                            EdgeInsetsDirectional.only(start: 15.w, top: 2.h),
                        itemCount: model.data.stories.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 10.w);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          var story = model.data.stories[index];
                          return CarStoryItem(
                            carImagePath: story.imagePath,
                            carType: story.title,
                          );
                        },
                      ),
                    ),
                    HorizontalOneImageBar(imagePath: model.data.banar),
                    SizedBox(height: AppSizes.sizedBoxHeightTiny),
                    SearchFelid(
                      onChanged: (searchValue) {},
                    ),
                    SizedBox(height: AppSizes.sizedBoxHeightTiny),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MainBottom(
                            buttonText: "أسيوي",
                            onPressed: () {},
                          ),
                          MainBottom(
                            buttonText: "أوروبي",
                            onPressed: () {},
                          ),
                          MainBottom(
                            buttonText: "أمريكى",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    GridCarsViewBar(
                      model.data.cars,
                      onCarItemPress: (car) {
                        Get.toNamed(Routes.CarDetailScreen,
                            arguments: {"car": car});
                      },
                    ),
                    HorizontalOneImageBar(imagePath: model.data.footer),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
