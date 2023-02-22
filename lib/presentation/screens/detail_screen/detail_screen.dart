import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/response/home/home_res_model.dart';
import '../../../model/home_Cars_Grid_item.dart';
import '../home_screen/home_controller.dart';
import '../home_screen/widgets/widgets.dart';
import 'widgets/widgets.dart';

class CarDetailScreen extends GetView<HomeController> {
  late Car _car;
  CarDetailScreen({super.key}) {
    _car = Get.arguments['car'];
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailScreenCarImageBar(
                  carImg: _car.imagePath,
                ),
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
                DetailScreenCarTextDetails(
                  detailText: _car.description,
                ),
                DetailScreenCarSupplier(
                    name: _car.agentName, imgPath: _car.agentImgUrl),
                const SizedBox(height: 15),
                HorizontalCarsBar(_car.more),
                const DetailScreenRowButtons()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalCarsBar extends StatelessWidget {
  const HorizontalCarsBar(
    this._list, {
    super.key,
  });
  final List<Car> _list;

  @override
  Widget build(BuildContext context) {
    if (_list.isNotEmpty) {
     return SizedBox(
        height: 150.h,
        width: double.infinity,
        child: ListView.separated(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: _list.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 5);
          },
          itemBuilder: (BuildContext context, int index) {
            var car = _list[index];
            return SizedBox(
              height: 150.h,
              width: 210.w,
              child: HomeCarGridItem(
                onCarItemPress: () {},
                carImage: car.imagePath,
                topHeadLineInfo: car.topHeadLine,
                detailsCarInfo: [
                  HomeDetailsCarItem(
                    iconPath: getCarInfoTypeIconPath(CarDetails.salary),
                    infoType: getCarInfoTypeWord(CarDetails.salary),
                    infoValue: "12700",
                  ),
                  HomeDetailsCarItem(
                    iconPath:
                        getCarInfoTypeIconPath(CarDetails.yearOfManufacture),
                    infoType: getCarInfoTypeWord(CarDetails.yearOfManufacture),
                    infoValue: "2019",
                  ),
                  HomeDetailsCarItem(
                    iconPath: getCarInfoTypeIconPath(CarDetails.kilometer),
                    infoType: getCarInfoTypeWord(CarDetails.kilometer),
                    infoValue: "20000",
                  ),
                  HomeDetailsCarItem(
                    // iconPath: "",
                    iconPath: getCarInfoTypeIconPath(CarDetails.guaranteedTo),
                    infoType: getCarInfoTypeWord(CarDetails.guaranteedTo),
                    infoValue: "2021",
                  ),
                ],
              ),
            );
          },
        ),
      );
    } else {
      return SizedBox();
    }

    
  }
}
