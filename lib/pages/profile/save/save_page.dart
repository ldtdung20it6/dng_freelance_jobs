// ignore_for_file: must_be_immutable, annotate_overrides, non_constant_identifier_names

import 'package:dng_freelance_jobs/pages/profile/save/save_controller.dart';
import 'package:dng_freelance_jobs/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavePage extends GetWidget<SaveController> {
  var controller = Get.put(SaveController());
  SavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleSpacing: 0,
            backgroundColor: Colors.grey[100],
            elevation: 0,
            pinned: true,
            centerTitle: false,
            expandedHeight: 200,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(Const.DefaultAvatar),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Lê Diên Trung Dũng",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[100],
              child: const Text(
                "Save List",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _renderMySaveList(
              "https://blog.topcv.vn/wp-content/uploads/2018/09/fpt-software.png",
              "Flutter dev",
              "3 year"),
          _renderMySaveList(
              "https://images.glints.com/unsafe/glints-dashboard.s3.amazonaws.com/company-logo/c8a82190abecd40ac6775c739d33253c.jpeg",
              "Reactjs dev",
              "2 year"),
        ],
      ),
    );
  }

  Widget _renderMySaveList(imageCorp, nameCorp, exp) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          _SaveList(imageCorp, nameCorp, exp),
          SizedBox(
            height: Get.height * 0.05,
          )
        ],
      ),
    );
  }

  Widget _SaveList(String imageCorp, String nameCorp, String exp) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: Get.width * 0.9,
      height: Get.height * 0.1,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                  width: Get.width * 0.2,
                  child: Image(image: NetworkImage(imageCorp))),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nameCorp,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text("Exp: $exp"),
                ],
              ),
            ],
          ),
          const Icon(
            Icons.favorite,
            color: Color.fromRGBO(143, 148, 251, 1),
          )
        ],
      ),
    );
  }
}
