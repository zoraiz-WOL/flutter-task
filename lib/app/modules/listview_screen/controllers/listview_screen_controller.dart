import 'package:flutter_task/utils/api_functions.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/user_info_model.dart';
import '../../../routes/app_pages.dart';

class ListviewScreenController extends GetxController {

  List<User> users=[];
  SharedPreferences? _storage;
  var loading = false.obs;
  @override
  void onInit() {
    super.onInit();
    //LOAD THE API FROM SERVER
    loadApiData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  loadApiData() async {
    loading(true);
    //POPULATE LIST BY CALLING API
   users = await get_User();
    loading(false);
  }

  //TODO: TASK3 TO CLEAR THE SESSION OF USER WHEN USER LOGOUT
  Future<void> clearSession()async{
    _storage = await SharedPreferences.getInstance();
    _storage?.clear();
    Get.toNamed(Routes.LOGIN_SCREEN);
  }
}
