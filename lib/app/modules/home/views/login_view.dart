import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: WillPopScope(
        //ASK WHETHER USER WANT TO EXIT FROM APP OR NOT
        onWillPop: () async {
          return await  Get.defaultDialog(title: "want to exit?" ,middleText: "",
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: (){exit(0) ;},
                      child:
                      Text("Yes",style:
                      TextStyle(color: Colors.white , fontWeight: FontWeight.bold)),),
                    RaisedButton(
                      onPressed: (){Get.back();},
                      child:
                      Text("No",style:
                      TextStyle(color: Colors.white , fontWeight: FontWeight.bold)),),
                  ],
                )
              ]
          );
        },
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(color: Colors.amber,),
              Positioned(
                  bottom: 0,
                  top: 200.h,
                  left: 10.w,
                  right: 10.w,
                  child: Container(
                    height: Get.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                     borderRadius: BorderRadius.only(topRight: Radius.circular(25.r) , topLeft: Radius.circular(25.r))
                    ),
                    child: SingleChildScrollView(
                      child: Column(

                        children: [
                          SizedBox(height: 80.h,),
                          Container(

                              width: 300.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r)
                              ),
                              child: TextFormField(
                                controller: controller.emailTxt,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.email),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),

                                    ),
                                    filled: true,
                                    hintStyle: TextStyle(color: Colors.grey),
                                    hintText: "Enter your email here",
                                    fillColor: Colors.white70),
                                validator: (String? value) {

                                  if (!controller.validateEmail(value!))
                                    {
                                      return "check you email";
                                    }
                                  if(value==null || value=="")
                                    {
                                      return "please enter email";
                                    }
                                },
                              )),
                          SizedBox(height: 20.h,),
                          Container(

                              width: 300.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.r)
                              ),
                              child: Obx((){
                             return TextFormField(
                                controller: controller.passwordTxt,
                                obscureText: controller.showPassword.value==false? true : false,
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                      onTap: ()=>controller.showPassword.toggle(),
                                      child: Icon(controller.showPassword.value==false?Icons.visibility_off : Icons.visibility)) ,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),

                                    ),
                                    filled: true,
                                    hintStyle: TextStyle(color: Colors.grey),
                                    hintText: "Enter your password here",
                                    fillColor: Colors.white70),
                                    validator: (String? value){
                                      if(value==null || value=="")
                                      {
                                        return "please enter password";
                                      }
                                    },
                              );
                                })),
                          SizedBox(height: 30.h,),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                controller.loginBtn(controller.emailTxt.text , controller.passwordTxt.text);

                              }

                            },
                            child: Container(
                              height: 50.h,
                              width: 300.w,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                  borderRadius: BorderRadius.circular(25.r)
                              ),
                              child: Center(child: Text("Login", style: TextStyle(fontSize: 20.sp,color: Colors.white, fontWeight: FontWeight.bold),)),),
                          ),
                          SizedBox(height: 80.h,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: 10.w,),
                              Image.asset("assets/gmailicon.png" , fit: BoxFit.cover, height: 30.h, width: 30.w,),
                              Image.asset("assets/facebookicon.png" , fit: BoxFit.cover, height: 30.h, width: 30.w,),
                              Image.asset("assets/twittericon.jpeg" , fit: BoxFit.cover, height: 35.h, width: 35.w,),
                              SizedBox(width: 10.w,),
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      )
    );
  }
}
