import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/response/home/home_res_model.dart';
import '../../../style/colors.dart';
import '../../../style/text_styles.dart';
import '../home_screen/home_controller.dart';
import '../home_screen/widgets/grid_cars_view_bar.dart';
import 'bars/detail_screen_car_guaranteed_to_bar.dart';
import 'bars/detail_screen_car_image_bar.dart';
import 'bars/detail_screen_car_info_bar.dart';
import 'bars/detail_screen_car_specifications_bar.dart';
import 'bars/detail_screen_car_status_and_salary_bar.dart';
import 'bars/detail_screen_car_supplier_bar.dart';
import 'bars/detail_screen_row_buttons_bar.dart';

class CarDetailScreen extends GetView<HomeController> {
  late Car _car;

  RxBool lodedd = false.obs;
  CarDetailScreen({super.key}) {
    _car = Get.arguments['car'];

    Future.delayed(const Duration(milliseconds: 0), () => lodedd(true));
  }
  @override
  Widget build(BuildContext context) {
    double mainHeight = MediaQuery.of(context).size.height;
    double spaceImageHeight = (mainHeight / 40);
    double spaceBodyHeight = (mainHeight / 10);

    double imageHeight = mainHeight * 0.3 + spaceImageHeight;
    double bodyDataHeight = mainHeight * 0.1 - spaceBodyHeight;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: kWhite,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: kWhite,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailScreenCarImageBar(
                  carImg: _car.imagePath,
                  hight: imageHeight,
                ),
                Obx(
                  () => AnimatedContainer(
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.fastOutSlowIn,
                    clipBehavior: Clip.none,
                    margin: EdgeInsets.only(
                      top: lodedd.value
                          ? bodyDataHeight
                          : MediaQuery.of(context).size.height,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailScreenCarInfoBar(
                          cylinder: _car.cylinder,
                          yearOfManufacture: int.parse(_car.yearOfManufacture),
                          kilometer: int.parse(_car.yearOfManufacture),
                        ),
                        DetailScreenCarStatusAndSalaryBar(
                          title: _car.status,
                          salary: _car.salary,
                        ),
                        DetailScreenCarGuaranteedToBar(
                          numKilo: _car.evenGuaranteed,
                        ),
                        DetailScreenCarSpecifications(
                          _car.features,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            _car.description,
                            style: fontBlack15SemiBold,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        DetailScreenCarSupplierBar(
                          name: _car.agentName,
                          imgPath: _car.agentImgUrl,
                        ),
                        const SizedBox(height: 15),
                        if (_car.more.isNotEmpty)
                          SizedBox(
                            height: 150.h,
                            width: double.infinity,
                            child: ListView.separated(
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: _car.more.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(width: 5);
                              },
                              itemBuilder: (BuildContext context, int index) {
                                var car = _car.more[index];
                                return SizedBox(
                                  height: 150.h,
                                  width: 210.w,
                                  child: HomeCarGridItem(
                                    onCarItemPress: () {},
                                    carImage: car.imagePath,
                                    topHeadLineInfo: car.topHeadLine,
                                    detailsCarInfo:  [
                                      HomeDetailsCarItem(
                                        type: CarDetails.salary,
                                        infoValue: car.salary,
                                      ),
                                      HomeDetailsCarItem(
                                        type: CarDetails.yearOfManufacture,
                                        infoValue: car.yearOfManufacture,
                                      ),
                                      HomeDetailsCarItem(
                                        type: CarDetails.kilometer,
                                        infoValue: car.kilometer,
                                      ),
                                      HomeDetailsCarItem(
                                        type: CarDetails.guaranteedTo,
                                        infoValue: car.guaranteedTo,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        const DetailScreenRowButtonsBar(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
