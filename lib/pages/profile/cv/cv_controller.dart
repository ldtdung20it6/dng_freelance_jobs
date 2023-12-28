import 'package:dng_freelance_jobs/models/cv.dart';
import 'package:dng_freelance_jobs/pages/profile/cv/cv_provider.dart';
import 'package:get/get.dart';

class CVController extends GetxController{
  RxList<CV> cv = RxList<CV>();
  @override
  void onInit() {
    super.onInit();
    getAllCV();
  }
  void getAllCV() async {
    try {
      var cvs = await CVProvider().getAllCV();
      if (cvs != null) {
        cv.assignAll(cvs);
      }
    } catch (error) {
      print('Error fetching jobs: $error');
    }
  }
}