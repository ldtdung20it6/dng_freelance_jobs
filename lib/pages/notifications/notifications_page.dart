// ignore_for_file: must_be_immutable

import 'package:dng_freelance_jobs/pages/notifications/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends GetWidget<NotificationController>{
  NotificationPage({super.key});
  var controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}