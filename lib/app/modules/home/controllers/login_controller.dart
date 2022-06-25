import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/utils/api_functions.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TEXTFIELD VARIABLES
  final emailTxt = TextEditingController();
  final passwordTxt = TextEditingController();
  final showPassword = false.obs;

  @override
  Future<void> onInit() async {

    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
//TODO: TASK1 LOGIN USER THROUGH API AND STORE SESSION
//CALL ACTION WHEN USER TAP ON LOGIN BUTTON
  Future<void> loginBtn (String email , String password)async{
    //WAIT THE USER UTIL LOGIN SUCCESS OR UNSUCCESS
    Get.defaultDialog(barrierDismissible: false,title: "",middleText: "Please wait..." );
    //API FUNCTION THAT ACKNOWLEDGE THE STATUS OF LOGIN PROCESS
   var status= await login_user(email,password);
  //CHECKING STATUS
   if (status=="success")
     {
       Get.back();
       Get.toNamed(Routes.LISTVIEW_SCREEN);
     }
   else{
     Get.back();
     Get.defaultDialog(barrierDismissible: false,title: "Alert" ,middleText: "", actions: [
       Column(mainAxisAlignment:MainAxisAlignment.spaceBetween,
         children: [Text("Login Failed!") ,
           RaisedButton(color: Colors.red, child: Text("Okay"),
               onPressed: (){Get.back();})],)]);
   }
  }

//REGEX PATTERN FOR VALID EMAIL,
  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }
}
