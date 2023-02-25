import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configuration/image/timage.dart';
import '../../../../style/text_styles.dart';

class DetailScreenCarSupplierBar extends StatelessWidget {
  const DetailScreenCarSupplierBar({
    Key? key,
    required this.name,
    required this.imgPath,
  }) : super(key: key);
  final String name;
  final String imgPath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffEDF1F3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: TNetImage(
                path: imgPath,
                height: 35,
                width: 35,
                fit: BoxFit.fill,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Text(
              name,
              style: fontBlack15Normal,
            ),
            Text(
              "كل السيارات",
              style: fontBlack15Normal,
            )
          ],
        ),
      ),
    );
  }
}
