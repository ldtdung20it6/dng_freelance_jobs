// ignore_for_file: must_be_immutable
import 'package:dng_freelance_jobs/pages/dash_board/dash_board_controller.dart';
import 'package:dng_freelance_jobs/pages/home/home_page.dart';
import 'package:dng_freelance_jobs/pages/inbox/inbox_page.dart';
import 'package:dng_freelance_jobs/pages/manage_oders/manage_oders_page.dart';
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
                  InboxPage(),
                  SearchPage(),
                  ManageOdersPage(),
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
                  label: 'Inbox',
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