import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TSvgPic extends StatelessWidget {
  const TSvgPic({
    Key? key,
     this.width,
     this.hight,
    required this.iconPath,
    required this.iconColor, this.fit,
  }) : super(key: key);

  final String iconPath;
  final double? hight, width;
  final Color iconColor;
final BoxFit? fit;



  

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      height:hight?? 15,
      width:width?? 15,
      color: iconColor,
      fit: fit?? BoxFit.contain,
    );
  }
}
