// ignore_for_file: must_be_immutable

import 'package:dng_freelance_jobs/models/jobs.dart';
import 'package:dng_freelance_jobs/pages/detail/detail_jobs/detail_jobs_controller.dart';
import 'package:dng_freelance_jobs/pages/profile/cv/cv_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class DetailJobsPage extends GetWidget<DetailController> {
  var cv_controller = Get.put(CVController());
  var controller = Get.put(DetailController());
  final Jobs jobs;

  DetailJobsPage({Key? key, required this.jobs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey[100],
              // padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(jobs.image),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  jobs.job_name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(height: 8),
                                Text(jobs.corp_id.toString()),
                              ],
                            ),
                          ],
                        ),
                        const Icon(Icons.favorite_border,
                            color: Color.fromRGBO(143, 148, 251, 1))
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(children: [
                      const Icon(Icons.monetization_on),
                      const SizedBox(width: 6),
                      Text(jobs.salary_id.toString())
                    ]),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(children: [
                      const Icon(Icons.map_outlined),
                      const SizedBox(width: 6),
                      Text(jobs.work_address)
                    ]),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(children: [
                      const Icon(Icons.timelapse_sharp),
                      const SizedBox(width: 6),
                      Text(jobs.deadline.toString())
                    ]),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      "Recruitment details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(jobs.job_description),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: Get.width * 0.3,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Obx(() {
                  var cvs = controller.cvController.cv;
                  if (cvs.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return SizedBox(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: cvs.length,
                        itemBuilder: (context, index) {
                          var cv = cvs[index];
                          return SizedBox(
                            width: Get.width,
                            child: ListTile(
                              title: Text('CV Name: ${cv.cv_name}'),
                              onTap: () {
                                String application_id = Uuid().v4();
                                controller.applyJob(application_id, cv.id_user,
                                    cv.cv_id, '', jobs.job_id);
                                Get.snackbar('Apply', 'Success');
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }
                });
              },
            );
          },
          backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Center(
            child: Text(
              'Apply Now',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
