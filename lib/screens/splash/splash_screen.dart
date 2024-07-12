import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitz/constants/routes.dart';

part "splash_controller.dart";

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: SizedBox(
        height: 812.h,
        width: 375.w,
        child: const Center(
          child: Text("Splash Screen"),
        ),
      ),
    );
  }
}
