import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/listview_screen_controller.dart';

class ListviewScreenView extends GetView<ListviewScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        backgroundColor: Colors.amber,
     actions:[ GestureDetector(
       onTap: () async => await controller.clearSession(),
       child: Container(
              margin:EdgeInsets.all(10) ,
            color: Colors.red,

             width: 80.w,
            child: Center(child: Text("Logout" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
            ),
          ),
     ),]

      ),
      body: WillPopScope(
        onWillPop: () async {
        return await  Get.defaultDialog(title: "want to exit?" ,middleText: "",
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: (){exit(0) ;}, child: Text("Yes",style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold)),),
                    RaisedButton(
                      onPressed: (){Get.back();}, child: Text("No",style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold)),),
                  ],
                )
              ]
          );

        },
        child:  SizedBox(
          //width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child:
          Obx(() {
            //TODO:TASK2 SHOWING USER DATA IN LISTVIEW
            //SHOW ACTIVITY INDICATOR WHILE LIST IS NOT POPULATED
            if (controller.loading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
               if (controller.users.isEmpty) {
                return Center(
                  child: Text("No conversations found"),
                );
              } else {
                return ListView.builder(
                    itemCount:
                    controller.users.length,
                    itemBuilder: (context, index) {
                      var item =
                          controller.users[index];
                      return ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text( "ID: "+item.id.toString()),
                          Text( "User ID: "+item.userId.toString()),
                          Text( "Title: "+item.title.toString()),
                            Divider(height: 2.h,)
                        ],)


                      );

                    });
              }
            }
          }),
        )
      ),
    );
  }
}
