import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

TextStyle bold15({Color? color}) {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: color);
}

TextStyle defaultWhiteLightText({double? fontSize}) {
  return TextStyle(
      color: Colors.white, fontWeight: FontWeight.w300, fontSize: fontSize);
}

var bold20MainColor = TextStyle(
  color: kMainColor,
  fontWeight: FontWeight.bold,
  fontSize: 20.sp,
);

var boldDefaultMainColor = TextStyle(
  fontWeight: FontWeight.bold,
  color: kMainColor,
  fontSize: 14.sp,
);

// 12 black 300

var font12BlackW200 = TextStyle(
  color: Colors.black,
  fontSize: 10.sp,
  fontWeight: FontWeight.w200,
);

var font10BlackBold = const TextStyle(
  color: Colors.black,
  fontSize: 10,
  fontWeight: FontWeight.bold,
);

var fontBlack15Normal = const TextStyle(
  color: Colors.black,
  fontSize: 15,
  fontWeight: FontWeight.w400,
);
var fontBlack15SemiBold = TextStyle(
  color: Colors.black,
  fontSize: 14.sp,
  fontWeight: FontWeight.w600,
);
var fontBlack15Bold = const TextStyle(
  color: Colors.black,
  fontSize: 15,
  fontWeight: FontWeight.w700,
);
var fontWhite17Medium = TextStyle(
  color: Colors.white,
  fontSize: 20.sp,
  fontWeight: FontWeight.w500,
);
var fontBlack20Normal = TextStyle(
  color: Colors.black,
  fontSize: 17.sp,
  fontWeight: FontWeight.w400,
);
var fontBlack20Light = const TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.w300,
);
var fontBlack25B = TextStyle(
  color: Colors.black,
  fontSize: 25.sp,
  fontWeight: FontWeight.w900,
);

var font13BlackMedium = TextStyle(
  color: Colors.black,
  fontSize: 13.sp,
  fontWeight: FontWeight.w500,
);

var font16BlackB = TextStyle(
  color: Colors.black,
  fontSize: 16.sp,
  fontWeight: FontWeight.w900,
);
