import 'package:dng_freelance_jobs/pages/detail/detail_jobs/detail_jobs_provider.dart';
import 'package:dng_freelance_jobs/pages/profile/cv/cv_controller.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  CVController cvController = Get.find();
  void applyJob(application_id, employee_id, cv_id, introduce, job_id) {
    DetailJobsProvider()
        .applyJob(application_id, employee_id, cv_id, introduce, job_id)
        .then((value) => {})
        .catchError((onError) {});
  }
}
