// ignore_for_file: must_be_immutable

import 'package:dng_freelance_jobs/pages/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends GetWidget<searchController>{
  SearchPage({super.key});
  var controller = Get.put(searchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}