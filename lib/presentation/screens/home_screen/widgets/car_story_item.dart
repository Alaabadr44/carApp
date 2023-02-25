// car_story_item
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configuration/image/timage.dart';
import '../../../../style/colors.dart';
import '../../../../style/text_styles.dart';

class CarStoryItem extends StatelessWidget {
  const CarStoryItem({
    Key? key,
    required this.carImagePath,
    required this.carType,
  }) : super(key: key);

  final String carImagePath;
  final String carType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Container(
          height: 70.h,
          width: 70.h,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              color: kCircleBorderColor,
            ),
            shape: BoxShape.circle,
          ),
          child: TNetImage(
            path: carImagePath,
            fit: BoxFit.fill,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Text(
          carType,
          style: bold15(),
        )
      ],
    );
  }
}
