// ignore_for_file: must_be_immutable
import 'package:dng_freelance_jobs/pages/dash_board/dash_board_controller.dart';
import 'package:dng_freelance_jobs/pages/home/home_page.dart';
import 'package:dng_freelance_jobs/pages/profile/application/application_page.dart';
import 'package:dng_freelance_jobs/pages/profile/corporation/create_and_edit_job/create_and_edit_job_page.dart';
import 'package:dng_freelance_jobs/pages/profile/cv/cv_page.dart';
import 'package:dng_freelance_jobs/pages/profile/profile_page.dart';
import 'package:dng_freelance_jobs/pages/search/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardPage extends GetWidget<DashboardController> {
  var controller = Get.put(DashboardController());

  DashBoardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  HomePage(),
                  Obx(() {
                    if(controller.profileController.user.value?.role == null){
                      return const CircularProgressIndicator();
                    }
                    if(controller.profileController.user.value!.role == "Employee"){
                      return CVPage(employee: controller.profileController.employee.value!,);
                    }
                    if(controller.profileController.user.value!.role == "Employer"){
                      return CreateAndEditJobPage(employer: controller.profileController.employer.value!,);
                    }
                    return Container();
                  }),
                  SearchPage(),
                  Obx(() {
                    if(controller.profileController.user.value?.role == null){
                      return const CircularProgressIndicator();
                    }
                    if(controller.profileController.user.value!.role == "Employee"){
                      return ApplicationPage(employee: controller.profileController.employee.value!,);
                    }
                    if(controller.profileController.user.value!.role == "Employer"){
                      return CreateAndEditJobPage(employer: controller.profileController.employer.value!,);
                    }
                    return Container();
                  }),
                  ProfilePage()
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Home'
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.mail),
                  label: 'CV',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.event_note_outlined),
                  label: 'Manage Oders',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person),
                  label: 'profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}