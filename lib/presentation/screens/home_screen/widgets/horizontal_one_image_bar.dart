// horizontal_one_image_bar
import 'package:flutter/material.dart';

import '../../../../configuration/image/timage.dart';
import '../../../../configuration/tcontext.dart';

class HorizontalOneImageBar extends StatelessWidget {
  const HorizontalOneImageBar({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    double height = TContext.getHeight(context);
    return SizedBox(
      width: double.infinity,
      height: height * 0.25,
      child: TNetImage(
        path: imagePath,
        fit: BoxFit.fill,
      ),
    );
  }
}
