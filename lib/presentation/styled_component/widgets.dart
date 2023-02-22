import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../style/colors.dart';
import '../../style/textstyles.dart';
import '../../util/icons.dart';

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
                backgroundColor: circleBorderColor,
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

class SearchFelid extends StatelessWidget {
  const SearchFelid({
    Key? key,
    required this.search,
  }) : super(key: key);

  final TextEditingController? search;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TextField(
      cursorColor: mainColor,
      keyboardType: TextInputType.text,
      controller: search,
      onSubmitted: (String searchValue) {},
      decoration: InputDecoration(
        alignLabelWithHint: true,
        hintText: "إبحث عن سيارتك".padLeft((width.toInt() * 0.07).toInt()),
        hintStyle: bold20MainColor,
        prefixIcon: const Icon(
          Icons.search,
          color: mainColor,
          size: 30,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 4),
          // gapPadding:
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: mainColor, width: 2),
          // gapPadding:
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}

class HomeOptionButtonItem extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  const HomeOptionButtonItem({
    Key? key,
    required this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
              right: Radius.circular(30), left: Radius.circular(30)),
        ),
        backgroundColor: mainColor,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: defaultWhiteLightText(),
      ),
    );
  }
}
