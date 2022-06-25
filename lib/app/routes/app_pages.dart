import 'package:get/get.dart';

import '../modules/home/bindings/login_binding.dart';
import '../modules/home/views/login_view.dart';
import '../modules/listview_screen/bindings/listview_screen_binding.dart';
import '../modules/listview_screen/views/listview_screen_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LISTVIEW_SCREEN,
      page: () => ListviewScreenView(),
      binding: ListviewScreenBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
