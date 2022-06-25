import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  var controller = Get.put(SplashController());
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Image.asset("assets/fluttergif.gif")
        ),
      );

  }
}
