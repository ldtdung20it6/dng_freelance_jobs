// ignore_for_file: unnecessary_null_comparison

import 'package:dng_freelance_jobs/models/jobs.dart';
import 'package:dng_freelance_jobs/pages/home/home_provider.dart';
import 'package:dng_freelance_jobs/pages/profile/profile_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ProfileController profileController = Get.find();
  RxList<Jobs> jobsList = RxList<Jobs>();

  @override
  void onInit() {
    super.onInit();
    getAllJobs();
  }

  void getAllJobs() async {
      var jobs = await HomeProvider().getAllJobs();
      if (jobs != null) {
        jobsList.assignAll(jobs);
      }
    
  }
}
