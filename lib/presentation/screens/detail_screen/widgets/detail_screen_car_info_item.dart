// detail_screen_car_info_item
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../style/text_styles.dart';

class DetailScreenCarInfoItem extends StatelessWidget {
  const DetailScreenCarInfoItem({
    Key? key,
    required this.iconPath,
    required this.infoWord,
    required this.infoValue,
  }) : super(key: key);

  final String iconPath;
  final String infoWord;
  final int infoValue;

  @override
  Widget build(BuildContext context) {
    double cardHeight = 110.h;
    double cardWidth = 110.w;

    return Container(
      height: cardHeight,
      width: cardWidth,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xfff7f7fd),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            height: cardHeight * 0.3,
            width: cardWidth * 0.3,
          ),
          SizedBox(height: cardHeight * 0.1),
          Text(
            infoWord,
            style: font13BlackMedium,
          ),
          Text(
            infoValue.toString(),
            style: font16BlackB,
          ),
        ],
      ),
    );
  }
}
