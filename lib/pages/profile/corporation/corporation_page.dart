// ignore_for_file: must_be_immutable

import 'package:dng_freelance_jobs/models/employer.dart';
import 'package:dng_freelance_jobs/pages/profile/corporation/corporation_controller.dart';
import 'package:dng_freelance_jobs/pages/profile/corporation/create_and_edit_job/create_and_edit_job_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CorporationPage extends GetWidget<CorporationController> {
  var controller = Get.put(CorporationController());
  final Employer employer;
  CorporationPage({super.key,required this.employer});

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
                    backgroundImage: NetworkImage("https://blog.topcv.vn/wp-content/uploads/2018/09/fpt-software.png"),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "FPT Software",
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
                "JOB OPEN",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _renderMyJobOpen(
              "https://blog.topcv.vn/wp-content/uploads/2018/09/fpt-software.png",
              "Flutter dev",
              "3 year"),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[100],
              child: const Text(
                "JOB CLOSED",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _renderMyJobClosed(
              "https://blog.topcv.vn/wp-content/uploads/2018/09/fpt-software.png",
              "Reactjs dev",
              "2 year"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => CreateAndEditJobPage(employer: employer,));
          }, 
          backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
          child: const Icon(Icons.add),
        ),
    );
  }

  Widget _renderMyJobOpen(imageCorp, nameCorp, exp) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          _SaveList(imageCorp, nameCorp, exp,"Open"),
          SizedBox(
            height: Get.height * 0.05,
          )
        ],
      ),
    );
  }
   Widget _renderMyJobClosed(imageCorp, nameCorp, exp) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          _SaveList(imageCorp, nameCorp, exp,"Closed"),
          SizedBox(
            height: Get.height * 0.05,
          )
        ],
      ),
    );
  }

  Widget _SaveList(String imageCorp, String nameCorp, String exp, String jobStatus) {
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
          
          Text(jobStatus,style:jobStatus == "Open" ? TextStyle(color: Colors.green,fontWeight: FontWeight.bold): TextStyle(color: Colors.red,fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
