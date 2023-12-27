// ignore_for_file: must_be_immutable

import 'package:dng_freelance_jobs/pages/detail/detail_jobs/detail_jobs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailJobsPage extends GetWidget<DetailController> {
  var controller = Get.put(DetailController());
  final String urlImage;
  final String userAvatar;
  final String userName;
  final String descriptJob;
  final String priceJob;

  DetailJobsPage({
    Key? key,
    required this.urlImage,
    required this.userAvatar,
    required this.userName,
    required this.descriptJob,
    required this.priceJob,
  }) : super(key: key);

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
            flexibleSpace: FlexibleSpaceBar(
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
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://blog.topcv.vn/wp-content/uploads/2018/09/fpt-software.png"),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Team Lead .NET",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 8),
                            Text('FPT software'),
                          ],
                        ),
                        ],),
                        Icon(Icons.favorite_border,color: Color.fromRGBO(143, 148, 251, 1))
                        
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Row(children: [
                      Icon(Icons.monetization_on),
                      SizedBox(width: 6),
                      Text("Up to \$2000")
                    ]),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Row(children: [
                      Icon(Icons.map_outlined),
                      SizedBox(width: 6),
                      Text("Da Nang")
                    ]),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Row(children: [
                      Icon(Icons.timelapse_sharp),
                      SizedBox(width: 6),
                      Text("Deadline: 15/12/2023")
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
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('''
• We are looking for an experienced Senior .NET or Team Lead .NET to build high-performing, scalable, enterprise-grade applications.
• You will be part of a talented software team that works for US customer.
• Designing and developing high-volume, low-latency applications
• Senior .NET Developer responsibilities include participating in the entire software development life cycle (Write design, coding, unit testing...), debugging applications and configuring existing systems
• Analyze system requirements and prioritize tasks
• Review and refactor code
• Providing support for junior developers.

Yêu cầu ứng viên
• At least 3,5 years of experience with .NET or .NET core
• Familiarity with web application development patterns and best practices

Familiarity with the following frameworks:
• .NET and .NET Core
• Entity Framework
• Experience with RDBMS - Oracle
• Experience with Git or other version controls
• English's good (both written and spoken)

'''),
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
          onPressed: () {},
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
