// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class CreateAndEditJobProvider {
  Future<void> createAndEdit(
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
    try {
      await FirebaseFirestore.instance.collection('jobs').doc(job_id).set({
        'job_id': job_id,
        'job_name': job_name,
        'num_of_recruit': num_of_recruit,
        'job_gender': job_gender,
        "corp_id": corp_id,
        'work_address': work_address,
        'job_description': job_description,
        'career_id': career_id,
        'exp_id': exp_id,
        'image':'https://blog.topcv.vn/wp-content/uploads/2018/09/fpt-software.png',
        'employer_id': employer_id,
        'province_id': province_id,
        'lever_id': lever_id,
        'way_to_work_id': way_to_work_id,
        'salary_id': salary_id,
        'state': state,
        'deadline': deadline,
        'created_at': created_at,
      });
    } catch (e) {
      rethrow;
    }
  }
}
