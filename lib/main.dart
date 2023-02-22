import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'configuration/binding/app_binding.dart';
import 'configuration/navigation/AppPages.dart';
import 'configuration/tcontext.dart';
import 'localization/Translation.dart';
import 'localization/change_language.dart';
import 'presentation/screens/home_screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(419, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'test',
              theme: TContext.getThemeData(),
              builder: _changeTextScaleFactor,
              initialBinding: AppBinding(),
              home: const HomeScreen(),
              getPages: AppPages.routes,
              translations: Translation(),
              locale: Locale(kDebugMode ? "ar" : TLang.getDeviceLocal().name),
            ));
  }

  Widget _changeTextScaleFactor(context, widget) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: widget!,
    );
  }
}
