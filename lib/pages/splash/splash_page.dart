// ignore_for_file: must_be_immutable

import 'package:dng_freelance_jobs/pages/splash/splash_controller.dart';
import 'package:dng_freelance_jobs/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetWidget<SplashController>{
  SplashPage({super.key});
  var controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.offAndToNamed(AppRoutes.WELCOME);
          },
          child: Image.asset('assets/images/logo.png')),
      ),
    );
  }
}