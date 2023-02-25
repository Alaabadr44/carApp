import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../configuration/image/timage.dart';
import '../../../../data/response/home/home_res_model.dart';
import '../../../../style/text_styles.dart';
import '../../../../util/icons.dart';
enum CarDetails {
  salary,
  yearOfManufacture,
  kilometer,
  guaranteedTo,
}
class GridCarsViewBar extends StatelessWidget {
  const GridCarsViewBar(
    this.cars, {
    Key? key,
    required this.onCarItemPress,
  }) : super(key: key);

  final Function(Car) onCarItemPress;

  final List<Car> cars;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding:  EdgeInsets.symmetric(horizontal: 5.h, vertical: 10.w),
        crossAxisSpacing: 5,
        mainAxisSpacing: 1.80,
        crossAxisCount: 2,
        children: <Widget>[
          ...cars
              .map(
                (car) => Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: HomeCarGridItem(
                    onCarItemPress: () => onCarItemPress(car),
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
                ),
              )
              .toList()
        ],
      ),
    );
  }
}

class HomeCarGridItem extends StatelessWidget {
  const HomeCarGridItem({
    Key? key,
    required this.carImage,
    required this.topHeadLineInfo,
    required this.detailsCarInfo,
    this.onCarItemPress,
  }) : super(key: key);

  final String carImage;
  final String topHeadLineInfo;
  final Function()? onCarItemPress;
  final List<HomeDetailsCarItem> detailsCarInfo;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCarItemPress,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 200,
                width: 350,
                child: TNetImage(
                  path: carImage,
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 250,
                  height: 20,
                  color: const Color(0xffEAE8EA),
                  child: Center(
                    child: Text(
                      topHeadLineInfo,
                      style: boldDefaultMainColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          PositionedDirectional(
            bottom: -10,
            start: 0,
            end: 0,
            child: SizedBox(
              width: 270.w,
              height: 45.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: detailsCarInfo,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomeDetailsCarItem extends StatelessWidget {
  final String infoValue;
  const HomeDetailsCarItem({
    Key? key,
    required this.infoValue,
    required this.type,
  }) : super(key: key);
  final CarDetails type;




String _getCarInfoTypeWord(CarDetails detail) {
    if (detail == CarDetails.salary) {
      return "السعر";
    } else if (detail == CarDetails.yearOfManufacture) {
      return "سنةالصنع";
    } else if (detail == CarDetails.kilometer) {
      return "كم";
    } else if (detail == CarDetails.guaranteedTo) {
      return "مكفولةل ";
    } else {
      return "";
    }
  }

  String _getCarInfoTypeIconPath(CarDetails detail) {
    if (detail == CarDetails.salary) {
      return iconHomeAd1;
    } else if (detail == CarDetails.yearOfManufacture) {
      return iconHomeAd2;
    } else if (detail == CarDetails.kilometer) {
      return iconHomeAd3;
    } else if (detail == CarDetails.guaranteedTo) {
      return iconHomeAd4;
    } else {
      return "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 49.w,
      decoration: BoxDecoration(
        color: const Color(0xffEAE8EA),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 2.2),
          Expanded(
            child: SvgPicture.asset(
              _getCarInfoTypeIconPath(type),
              height: 10,
              width: 10,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              _getCarInfoTypeWord(type),
              style: font12BlackW200,
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              infoValue,
              style: font10BlackBold,
            ),
          ),
        ],
      ),
    );
  }
}
