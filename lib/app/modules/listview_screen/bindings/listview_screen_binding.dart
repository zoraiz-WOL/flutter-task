import 'package:get/get.dart';

import '../controllers/listview_screen_controller.dart';

class ListviewScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListviewScreenController>(
      () => ListviewScreenController(),
    );
  }
}
