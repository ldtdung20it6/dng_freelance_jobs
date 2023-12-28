// ignore_for_file: must_be_immutable, annotate_overrides, prefer_final_fields, unused_element

import 'package:dng_freelance_jobs/pages/detail/detail_corp/detail_corp_page.dart';
import 'package:dng_freelance_jobs/pages/detail/detail_jobs/detail_jobs_page.dart';
import 'package:dng_freelance_jobs/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<HomeController> {
  var controller = Get.put(HomeController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Obx(() {
                  if (controller.profileController.user.value == null) {
                    return const CircularProgressIndicator();
                  }
                  if (controller.profileController.user.value!.role ==
                      "Employee") {
                    if (controller.profileController.employee.value?.id_user ==
                        null) {
                      return const CircularProgressIndicator();
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nice to see you, ${controller.profileController.employee.value!.full_name}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                            width: Get.width * 0.10,
                            height: Get.height * 0.10,
                            child: CircleAvatar(
                                backgroundImage: NetworkImage(controller
                                    .profileController.employee.value!.image
                                    .toString())))
                      ],
                    );
                  }
                  if (controller.profileController.user.value!.role ==
                      "Employer") {
                    if (controller.profileController.employer.value?.id_user ==
                        null) {
                      return const CircularProgressIndicator();
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nice to see you, ${controller.profileController.employer.value!.full_name}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                            width: Get.width * 0.10,
                            height: Get.height * 0.10,
                            child: CircleAvatar(
                                backgroundImage: NetworkImage(controller
                                    .profileController.employer.value!.image
                                    .toString())))
                      ],
                    );
                  }
                  return Container();
                }),
              ),
              SizedBox(height: Get.height * 0.05),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Leading corporations",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: Get.height * 0.25,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _renderPopularServices(
                      'https://blog.topcv.vn/wp-content/uploads/2018/09/fpt-software.png',
                      'FPT Software',
                    ),
                    const SizedBox(width: 20),
                    _renderPopularServices(
                      'https://images.glints.com/unsafe/glints-dashboard.s3.amazonaws.com/company-logo/c8a82190abecd40ac6775c739d33253c.jpeg',
                      'BAP Software',
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Best job ",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: Get.height * 0.25,
                child: Obx(() {
                  var jobsList = controller.jobsList;
                  if (jobsList.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return SizedBox(
                      width: Get.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: jobsList.length,
                        itemBuilder: (context, index) {
                          var job = jobsList[index];
                          return _renderJobs(
                            job.image,
                            job.corp_id,
                            job.job_name,
                            job.salary_id,
                            job
                          );
                        },
                      ),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderJobs(urlImage, UserName, descriptJob, priceJob,jobs) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() =>DetailJobsPage(
              jobs: jobs,
                // urlImage: urlImage,
                // userName: UserName,
                // descriptJob: descriptJob,
                // priceJob: priceJob
                ));
          },
          child: Container(
            width: Get.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: Get.width * 0.3,
                    height: Get.height * 0.1,
                    child: Image.network(urlImage)),
                SizedBox(height: Get.height * 0.02),
                Text(UserName),
                Text(descriptJob, overflow: TextOverflow.ellipsis),
                Text(
                  "\$$priceJob",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20)
      ],
    );
  }

  Widget _renderPopularServices(srcImage, title) {
    return GestureDetector(
      onTap: () => Get.to(DetailCorpPage()),
      child: Container(
        width: Get.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: Get.width * 0.3,
                height: Get.height * 0.1,
                child: Image.network(
                  srcImage,
                  fit: BoxFit.cover,
                )),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
