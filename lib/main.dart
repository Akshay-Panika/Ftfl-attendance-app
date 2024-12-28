import 'package:flutter/material.dart';
import 'package:ftfl_attendance_app/screen_view/build_bottom_nav.dart';
import 'package:ftfl_attendance_app/screen_view/splash_screen.dart';
import 'package:get/get.dart';



void main()async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () =>  SplashScreen(),),
        GetPage(name: '/bottomNav', page: () =>  BuildBottomNav(),),
      ],
    );
  }
}