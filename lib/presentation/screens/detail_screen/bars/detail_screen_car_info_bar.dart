// detail_screen_car_info_bar
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/icons.dart';
import '../widgets/detail_screen_car_info_item.dart';

class DetailScreenCarInfoBar extends StatelessWidget {
  const DetailScreenCarInfoBar({
    Key? key,
    required this.cylinder,
    required this.yearOfManufacture,
    required this.kilometer,
  }) : super(key: key);

  final int kilometer;
  final int cylinder;
  final int yearOfManufacture;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 110.h,
          width: double.maxFinite,
          color: Colors.white,
        ),
        PositionedDirectional(
          top: -20.h,
          start: 0,
          end: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               SizedBox(width: 10.w),
              DetailScreenCarInfoItem(
                iconPath: iconCarPageSlindr,
                infoWord: "المحرك /  سليندر",
                infoValue: cylinder,
              ),
              DetailScreenCarInfoItem(
                iconPath: iconHomeAd2,
                infoValue: yearOfManufacture,
                infoWord: "سنة التصنيع",
              ),
              DetailScreenCarInfoItem(
                iconPath: iconHomeAd3,
                infoValue: kilometer,
                infoWord: "المشي",
              ),
              SizedBox(width: 10.w),
            ],
          ),
        )
      ],
    );
  }
}
