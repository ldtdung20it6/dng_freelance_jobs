// ignore_for_file: non_constant_identifier_names, avoid_print, must_be_immutable, annotate_overrides

import 'package:dng_freelance_jobs/models/employee.dart';
import 'package:dng_freelance_jobs/pages/profile/cv/create_and_edit_cv/create_and_edit_cv_page.dart';
import 'package:dng_freelance_jobs/pages/profile/cv/cv_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CVPage extends GetWidget<CVController> {
  var controller = Get.put(CVController());
  final Employee employee;
  CVPage({super.key, required this.employee});

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
            flexibleSpace: FlexibleSpaceBar(
              background: const Image(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(employee.image),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    employee.full_name,
                    style: const TextStyle(fontSize: 10),
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
                "My CV",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  var cvs = controller.cv;
                  if (cvs.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return SizedBox(
                      height: Get.height, 
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: cvs.length,
                        itemBuilder: (context, index) {
                          var cv = cvs[index];
                          return _renderMyCV(
                            employee.image,
                            cv.cv_name,
                            cv.exp_id,
                          );
                        },
                      ),
                    );
                  }
                }),
                SizedBox(
                  height: Get.height * 0.05,
                )
              ],
            ),

          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateAndEditCVPage(
                employee: employee,
              ));
        },
        backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _renderMyCV(imageCV, cv_name, exp) {
    return Column(
      children: [
        _MyCV(imageCV, cv_name, exp),
        SizedBox(
          height: Get.height * 0.05,
        )
      ],
    );
  }

  Widget _MyCV(String imageCV, String cv_name, String exp) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: Get.width * 0.9,
      height: Get.height * 0.1,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Image(image: NetworkImage(imageCV)),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cv_name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text("Exp: $exp"),
            ],
          )
        ],
      ),
    );
  }
}
