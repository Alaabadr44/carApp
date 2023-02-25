// notification_widget
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../style/colors.dart';
import '../../../style/text_styles.dart';
import '../../../util/icons.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key? key,
    required this.notificationNum,
  }) : super(key: key);

  final int notificationNum;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // return Badge(
    //   isLabelVisible: true,
    //   alignment: AlignmentDirectional.topStart,
    //   padding: const EdgeInsetsDirectional.only(start: 2, end: 5),
    //   label: Text(
    //     notificationNum.toString(),
    //     style: const TextStyle(
    //       color: Colors.white,
    //     ),
    //   ),
    //   child: SizedBox(
    //     height: 25,
    //     width: 25,
    //     child: SvgPicture.asset(
    //       iconHomeNotification,
    //       fit: BoxFit.fill,
    //     ),
    //   ),
    // );

    return Stack(
      alignment: AlignmentDirectional.topStart,
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 25,
          width: width * 0.07,
          child: SvgPicture.asset(iconHomeNotification),
        ),
        PositionedDirectional(
          start: -5,
          top: -5,
          child: Visibility(
            visible: notificationNum > 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: CircleAvatar(
                backgroundColor: kCircleBorderColor,
                radius: 7,
                child: Center(
                  child: Text(
                    notificationNum.toString(),
                    style: defaultWhiteLightText(fontSize: 12.sp),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
