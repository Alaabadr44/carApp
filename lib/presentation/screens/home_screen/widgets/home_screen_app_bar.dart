// home_screen_app_bar
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../style/colors.dart';
import '../../../../util/icons.dart';
import '../../../styled_component/reuse-widget/notification_widget.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar(
    this.notificationNum, {
    Key? key,
  }) : super(key: key);

  final int notificationNum;

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
      height: 70.h,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: statusbarHeight * 2,
        right: 10.w,
        left: 10.w,
      ),
      // margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kAppBarBackGroundColorFirst,
            kAppBarBackGroundColorSecond,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 25,
                width: 20,
                child: SvgPicture.asset(
                  iconHomeMenu,
                ),
              ),
              NotificationWidget(
                notificationNum: notificationNum,
              )
            ],
          ),
        ],
      ),
    );
  }
}
