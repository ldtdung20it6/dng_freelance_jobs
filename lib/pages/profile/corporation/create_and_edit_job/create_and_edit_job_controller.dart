// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:dng_freelance_jobs/models/career.dart';
import 'package:dng_freelance_jobs/pages/profile/corporation/create_and_edit_job/create_and_edit_job_provider.dart';
import 'package:get/get.dart';

class CreateAndEditJobController extends GetxController {
  RxString selectedItem = ''.obs;
  RxInt timestamp = RxInt(0);
  RxList<Career> suggestions = <Career>[].obs;

  void setSelectedItem(String value) {
    selectedItem.value = value;
  }

  void setSuggestions(List<Career> suggestionList) {
    suggestions.assignAll(suggestionList);
  }

  void createAndEditJob(
    String job_id,
    String job_name,
    String num_of_recruit,
    String job_gender,
    String corp_id,
    String work_address,
    String job_description,
    String career_id,
    String exp_id,
    String employer_id,
    String province_id,
    String lever_id,
    String way_to_work_id,
    String salary_id,
    String state,
    String deadline,
    DateTime created_at,
  ) async {
    await CreateAndEditJobProvider()
        .createAndEdit(
          job_id,
          job_name,
          num_of_recruit,
          job_gender,
          corp_id,
          work_address,
          job_description,
          career_id,
          exp_id,
          employer_id,
          province_id,
          lever_id,
          way_to_work_id,
          salary_id,
          state,
          deadline,
          created_at,
        )
        .then((value) => {})
        .catchError((onError) {
      print(onError);
    });
  }
}
