// ignore_for_file: must_be_immutable, annotate_overrides

import 'package:dng_freelance_jobs/pages/manage_oders/manage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageOdersPage extends GetWidget<ManageOdersController>{
  var controller = Get.put(ManageOdersController());

  ManageOdersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage orders',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[100],
        child: const Center(child: Text('No Orders Yet')),
      ),
    );
  }
  
}