// detail_screen_circle_bottom_button
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configuration/svgs/t_svg.dart';
import 'package:flutter_application_1/style/colors.dart';

class DetailScreenCircleBottomButton extends StatelessWidget {
  const DetailScreenCircleBottomButton({
    Key? key,
    required this.iconPath,
    required this.iconColor,
    required this.backGroundColor,
    required this.onPressed,
  }) : super(key: key);
  final String iconPath;
  final Color iconColor;
  final Color backGroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: CircleAvatar(
        backgroundColor: backGroundColor.withOpacity(0.3),
        foregroundColor: kTransparent,
        radius: 20,
        child: TSvgPic(
          iconPath: iconPath,
          hight: 15,
          width: 15,
          iconColor: iconColor,
        ),
      ),
    );
  }
}
