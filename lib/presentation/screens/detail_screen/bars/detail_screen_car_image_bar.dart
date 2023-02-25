// detail_screen_car_image_bar
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

import '../../../../configuration/image/timage.dart';
import '../../../../util/icons.dart';

class DetailScreenCarImageBar extends StatelessWidget {
  const DetailScreenCarImageBar({
    Key? key,
    required this.carImg,
    required this.hight,
  }) : super(key: key);
  final String carImg;
  final double hight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            child: TNetImage(
              path: carImg,
              height: hight,
              width: double.maxFinite,
              fit: BoxFit.fill,
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.rtl,
            top: 10.h,
            start: 5.w,
            child: DetailScreenIconWidget(
              iconPath: iconBackIcon,
              onIconPress: () {
                Get.back();
              },
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.rtl,
            top: 10.h,
            end: 10.h,
            child: Row(
              children: [
                DetailScreenIconWidget(
                  iconPath: iconCarPageShare,
                  onIconPress: () {},
                ),
                 SizedBox(width: 10.w),
                DetailScreenIconWidget(
                  iconPath: iconCarPageFav,
                  onIconPress: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DetailScreenIconWidget extends StatelessWidget {
  const DetailScreenIconWidget({
    Key? key,
    required this.iconPath,
    required this.onIconPress,
  }) : super(key: key);
  final String iconPath;
  final void Function()? onIconPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onIconPress,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.7),
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            height: 15,
            width: 15,
          ),
        ),
      ),
    );
  }
}
