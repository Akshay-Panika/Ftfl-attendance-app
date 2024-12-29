import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftfl_attendance_app/custom_widget/custom_textstyle.dart';
import 'package:get/get.dart';
import '../getx_controllers/splash_getx_controller.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashGetXController splashGetXController = Get.put(SplashGetXController());

  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    return  Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on_outlined, size: 80, color: Colors.green,),
            Text("AM HERE", style: textStyle16(fontWeight: FontWeight.bold, color: Colors.black),),
          ],
        ),
      ),
    );
  }
}
