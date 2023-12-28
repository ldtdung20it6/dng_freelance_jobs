import 'package:dng_freelance_jobs/pages/profile/profile_controller.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  ProfileController profileController = Get.find();
  var tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
