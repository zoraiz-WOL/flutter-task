import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';
class SplashController extends GetxController {
  //TODO: Implement SplashController
  SharedPreferences? _storage;

  @override
  Future<void> onInit() async {

    var Sessionstatus= await checkSession();
    await Future.delayed(Duration(milliseconds: 5000),(){
      if(Sessionstatus==false){
        Get.toNamed(Routes.LOGIN_SCREEN);
      }
      else{ Get.toNamed(Routes.LISTVIEW_SCREEN);}
    });
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<bool> checkSession()async {
    _storage = await SharedPreferences.getInstance();
    var email = await _storage?.getString("email");
    var password =await  _storage?.getString("password");
    if (email==null && password==null)
    {
      return false;

    }
    else{
     return true;
    }
  }
}
