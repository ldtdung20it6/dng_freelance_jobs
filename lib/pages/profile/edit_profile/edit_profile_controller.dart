// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:dng_freelance_jobs/models/employee.dart';
import 'package:dng_freelance_jobs/models/employer.dart';
import 'package:dng_freelance_jobs/pages/profile/edit_profile/edit_profile_provider.dart';
import 'package:dng_freelance_jobs/pages/profile/profile_controller.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  ProfileController profileController = Get.find();
  var avatarImageUrl = ''.obs;
  
  Future<void> updateInfoEmployee(Employee employee, String full_name,
      String gender, String image, String phone_number) async {
    var update = await EditprofileProvider()
        .updateEmployee(employee.id_user, full_name, gender, image, phone_number)
        .then((value) => () {
              Get.snackbar("Update complete", "Update complete");
              Get.back();
            })
        .catchError((e) {
      throw (e);
    });
  }
  Future<void> updateInfoEmployer(Employer employer, String full_name,
      String gender, String image, String phone_number) async {
    var update = await EditprofileProvider()
        .updateEmployer(employer.id_user, full_name, gender, image, phone_number)
        .then((value) => () {
              Get.snackbar("Update complete", "Update complete");
              Get.back();
            })
        .catchError((e) {
      throw (e);
    });
  }

  
}
