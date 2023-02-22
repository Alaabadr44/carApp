import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

enum Lang { ar, en }

class TLang {
  static ar() async {
    await Jiffy.locale(Lang.ar.name);
    Get.updateLocale(Locale(Lang.ar.name));
  }

  static en() async {
    await Jiffy.locale(Lang.en.name);
    Get.updateLocale(Locale(Lang.en.name));
  }

  static isEnglish(String value) {
    String englishChar = 'qwertyuiopasdfghjklzxcbnm';
    bool isEnglishChar = englishChar.contains(value.trim()[0].toLowerCase());
    // Print.info('isEnglishChar $value :: $isEnglishChar');
    return isEnglishChar;
  }

  static Lang getDeviceLocal() {
    return Get.deviceLocale!.languageCode == Lang.ar.name ? Lang.ar : Lang.en;
  }

  static Lang getCurrentLocale() {
    return Get.locale!.languageCode == Lang.ar.name ? Lang.ar : Lang.en;
  }

  static bool isArabic() {
    return getCurrentLocale() == Lang.ar;
  }
}
