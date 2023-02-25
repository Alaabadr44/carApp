// detail_screen_car_guaranteed_to_bar
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../style/text_styles.dart';
import '../../../../util/icons.dart';

class DetailScreenCarGuaranteedToBar extends StatelessWidget {
  const DetailScreenCarGuaranteedToBar({
    Key? key,
    required this.numKilo,
  }) : super(key: key);
  final String numKilo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Container(
          height: 35.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: const Color(0xffa55959),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                iconHomeAd4,
                height: 20,
                width: 20,
                color: Colors.white,
              ),
              Text(
                "مكفولة حتى $numKilo كم",
                style: fontWhite17Medium,
              ),
              const SizedBox(width: 10),
              const SizedBox(width: 5),
            ],
          )),
    );
  }
}
