import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../style/colors.dart';
import '../../../../style/dimisions.dart';
import '../../../../util/icons.dart';
import '../widgets/detail_screen_bottom_icon_button.dart';
import '../widgets/detail_screen_circle_bottom_button.dart';

class DetailScreenRowButtonsBar extends StatelessWidget {
  const DetailScreenRowButtonsBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pW3),
      child: SizedBox(
        height: 120.h,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DetailScreenCircleBottomButton(
                    backGroundColor: kBackGroundGreenFb,
                    iconColor: const Color.fromARGB(255, 4, 86, 42),
                    iconPath: iconCarPageCall,
                
                    onPressed: () {},
                  ),
                  DetailScreenCircleBottomButton(
                    backGroundColor: kBackGroundBlueFb,
                    iconColor: const Color(0xff6367FF),
                    iconPath: iconCarPageChatByWHatsApp,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DetailScreenBottomIconButton(
                  type: BtnBackGround.dark,
                  buttonColor: kMainColor,
                  buttonText: "موقع السيارة",
                  iconColor: kWhite,
                  iconPath: iconCarPageLocation,
                  textColor: kWhite,
                  onPressed: () {},
                ),
                 SizedBox(width: 10.w),
              
                DetailScreenBottomIconButton(
                  type: BtnBackGround.light,
                  buttonColor: kWhite,
                  buttonText: "إحجز سيارتك",
                  iconColor: kMainColor,
                  iconPath: iconCarPageBook,
                  textColor: kMainColor,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
