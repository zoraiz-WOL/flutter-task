import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(

    ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return  GetMaterialApp(
        title: "Application",

        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );},

    ),
  );
}
