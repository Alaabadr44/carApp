import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/colors.dart';
import '../../../style/text_styles.dart';



class AppBottoms{

}
















class MainBottom extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  const MainBottom({
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
        backgroundColor: kMainColor,
        padding:  EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: defaultWhiteLightText(),
      ),
    );
  }
}
