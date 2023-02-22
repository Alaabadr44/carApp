import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TContext {
  static ThemeData getThemeData() {
    return ThemeData(
        // canvasColor: Colors.transparent,
        );
  }

  static double getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  ThemeData getTheme() {
    return Theme.of(Get.context!);
  }
}
