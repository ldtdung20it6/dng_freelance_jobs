import 'package:dng_freelance_jobs/models/application.dart';
import 'package:dng_freelance_jobs/models/jobs.dart';
import 'package:dng_freelance_jobs/pages/profile/application/application_provider.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController {
  RxList<Application> application = RxList<Application>();
  RxList<Jobs?> jobs =
      RxList<Jobs>();

  @override
  void onInit() {
    super.onInit();
    getAllCV();
  }

  void getAllCV() async {
    try {
      var applications = await ApplicationProvider().getAll();
      if (applications != null) {
        application.assignAll(applications);
      }
    } catch (error) {
      print('Error fetching jobs: $error');
    }
  }
  void getJobByID(id) async {
  try {
    var job = await ApplicationProvider().getJobByID(id);
    if (job != null) {
      jobs.assign(job);
    }
  } catch (error) {
    print('Error fetching jobs: $error');
  }
}

}
