// ignore_for_file: annotate_overrides, must_be_immutable

import 'package:dng_freelance_jobs/pages/create/create_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePage extends GetWidget<CreateController>{
  CreatePage({super.key});
  var controller = Get.put(CreateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}