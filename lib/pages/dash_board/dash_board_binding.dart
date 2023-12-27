import 'package:dng_freelance_jobs/pages/create/create_controller.dart';
import 'package:dng_freelance_jobs/pages/dash_board/dash_board_controller.dart';
import 'package:dng_freelance_jobs/pages/home/home_controller.dart';
import 'package:dng_freelance_jobs/pages/inbox/inbox_controller.dart';
import 'package:dng_freelance_jobs/pages/manage_oders/manage_controller.dart';
import 'package:dng_freelance_jobs/pages/notifications/notifications_controller.dart';
import 'package:dng_freelance_jobs/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SearchController>(() => SearchController());
    Get.lazyPut<CreateController>(() => CreateController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<InboxController>(() => InboxController());
    Get.lazyPut<ManageOdersController>(() => ManageOdersController());
  }
}