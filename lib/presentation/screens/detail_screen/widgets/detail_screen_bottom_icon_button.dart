import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configuration/svgs/t_svg.dart';
import '../../../../style/colors.dart';
import '../../../../util/icons.dart';

enum BtnBackGround { light, dark }

class DetailScreenBottomIconButton extends StatelessWidget {
  const DetailScreenBottomIconButton({
    Key? key,
    required this.buttonText,
    required this.iconPath,
    required this.iconColor,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
    required this.type,
  }) : super(key: key);
  final String buttonText;
  final String iconPath;
  final Color buttonColor;
  final Color iconColor;
  final Color textColor;
  final void Function()? onPressed;
  final BtnBackGround type;

  _backGroundColor(type) {
    return type == BtnBackGround.dark ? kMainColor : kWhite;
  }

  _textColor(type) {
    return type != BtnBackGround.dark ? kMainColor : kWhite;
  }

  @override
  Widget build(BuildContext context) {
// just for solution for location icon
    Icon? location = iconPath == iconCarPageLocation
        ? Icon(
            Icons.location_on_outlined,
            color: Colors.white.withOpacity(0.45),
            size: 25,
          )
        : null;

    return SizedBox(
      height: 30.h,
      width: 120,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: location == null
            // ? SvgPicture.asset(
            //     iconPath,
            // height: 15.h,
            // width: 15.w,
            //     color: iconColor,
            //     fit: BoxFit.cover,
            //   )

            ? TSvgPic(
                iconPath: iconPath,
                iconColor: iconColor,
                hight: 15.h,
                width: 15.w,
                fit: BoxFit.cover,
              )
            : SizedBox(child: location),
        label: Text(
          buttonText,
          style: TextStyle(
            color: _textColor(type),
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
        style: _style(),
      ),
    );
  }

  ButtonStyle _style() {
    return ElevatedButton.styleFrom(
      backgroundColor: _backGroundColor(type),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(30),
          left: Radius.circular(30),
        ),
        side: BorderSide(
          color: kMainColor,
          width: 1,
        ),
      ),
    );
  }
}
