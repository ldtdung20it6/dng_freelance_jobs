// ignore_for_file: must_be_immutable, annotate_overrides, non_constant_identifier_names, unused_element, unused_local_variable

import 'package:dng_freelance_jobs/pages/profile/application/application_page.dart';
import 'package:dng_freelance_jobs/pages/profile/corporation/corporation_page.dart';
import 'package:dng_freelance_jobs/pages/profile/cv/cv_page.dart';
import 'package:dng_freelance_jobs/pages/profile/edit_profile/edit_profile_page.dart';
import 'package:dng_freelance_jobs/pages/profile/profile_controller.dart';
import 'package:dng_freelance_jobs/pages/profile/save/save_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetWidget<ProfileController> {
  ProfilePage({super.key});
  var controller = Get.put(ProfileController());
  var MY_INFO = 'info';
  var SINGOUT = 'singout';
  var ABOUT_APP = 'about_app';
  var MY_CV = 'my_cv';
  var MY_APPLICATION = 'my_application';
  var SAVED = 'saved';
  var CORPORATION = 'corporation';

  textType(TYPE) {
    if (TYPE == MY_INFO) {
      return 'Personal information';
    } else if (TYPE == ABOUT_APP) {
      return 'About app';
    } else if (TYPE == SINGOUT) {
      return 'Sing out';
    } else if (TYPE == MY_CV) {
      return 'My CV';
    } else if (TYPE == SAVED) {
      return 'Saved list';
    } else if (TYPE == MY_APPLICATION) {
      return 'My application';
    } else if (TYPE == CORPORATION) {
      return 'My corporation';
    }
  }

  IconType(TYPE) {
    if (TYPE == MY_INFO) {
      return const Icon(Icons.person);
    } else if (TYPE == ABOUT_APP) {
      return const Icon(Icons.abc_outlined);
    } else if (TYPE == SINGOUT) {
      return const Icon(Icons.logout);
    } else if (TYPE == MY_CV) {
      return const Icon(Icons.document_scanner);
    } else if (TYPE == SAVED) {
      return const Icon(Icons.favorite_border);
    } else if (TYPE == MY_APPLICATION) {
      return const Icon(Icons.format_list_bulleted_add);
    } else if (TYPE == CORPORATION) {
      return const Icon(Icons.corporate_fare);
    }
  }

  buttonType(TYPE) {
    if (TYPE == MY_INFO) {
      return Get.to(() => EditProfilePage(
          // employee: controller.employee.value!,
          // employer: controller.employer.value!
          ));
    } else if (TYPE == ABOUT_APP) {
      return controller;
    } else if (TYPE == SINGOUT) {
      return controller.signOut();
    } else if (TYPE == MY_CV) {
      return Get.to(() => CVPage(employee: controller.employee.value!));
    } else if (TYPE == SAVED) {
      return Get.to(() => SavePage());
    } else if (TYPE == MY_APPLICATION) {
      return Get.to(() => ApplicationPage());
    } else if (TYPE == CORPORATION) {
      return Get.to(() => CorporationPage());
    }
  }

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
              title: Obx(
                () {
                  if (controller.user.value?.id_user == null) {
                    return const CircularProgressIndicator();
                  }
                  if (controller.user.value!.role == "Employee") {
                    controller.loadEmployeeData();

                    if (controller.employee.value?.id_user == null) {
                      return const CircularProgressIndicator();
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                              controller.employee.value!.image.toString()),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          controller.employee.value!.full_name.toString(),
                          style: const TextStyle(fontSize: 10),
                        )
                      ],
                    );
                  }
                  if (controller.user.value!.role == "Employer") {
                    controller.loadEmployerData();
                    if (controller.employer.value?.id_user == null) {
                      return const CircularProgressIndicator();
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                              controller.employer.value!.image.toString()),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          controller.employer.value!.full_name.toString(),
                          style: const TextStyle(fontSize: 10),
                        )
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[100],
              child: const Text(
                "My Personal",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _renderMenuFunc(MY_INFO),
          _renderMenuFunc(MY_CV),
          _renderMenuFunc(MY_APPLICATION),
          _renderMenuFunc(SAVED),
          _renderMenuFunc(CORPORATION),
          _renderMenuFunc(ABOUT_APP),
          _renderMenuFunc(SINGOUT),
        ],
      ),
    );
  }

  Widget _renderMenuFunc(TYPE) {
    return SliverToBoxAdapter(
      child: Column(children: [
        _MenuFunc(TYPE),
        const SizedBox(
          height: 8,
        )
      ]),
    );
  }

  Widget _MenuFunc(TYPE) {
    return GestureDetector(
      onTap: () {
        buttonType(TYPE);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 1.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: Get.width * 0.1, child: IconType(TYPE)),
            SizedBox(
              width: Get.width * 0.8,
              child: Text(
                textType(TYPE),
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
