// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Jobs {
  final String job_id;
  final String job_name;
  final String num_of_recruit;
  final String job_gender;
  final String corp_id;
  final String work_address;
  final String job_description;
  final String career_id;
  final String exp_id;
  final String employer_id;
  final String province_id;
  final String lever_id;
  final String way_to_work_id;
  final String salary_id;
  final String state;
  final String image;
  final String deadline;
  final DateTime created_at;
  Jobs({
    required this.job_id,
    required this.job_name,
    required this.num_of_recruit,
    required this.job_gender,
    required this.corp_id,
    required this.work_address,
    required this.job_description,
    required this.career_id,
    required this.exp_id,
    required this.employer_id,
    required this.province_id,
    required this.lever_id,
    required this.way_to_work_id,
    required this.salary_id,
    required this.state,
    required this.image,
    required this.deadline,
    required this.created_at,
  });
  factory Jobs.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Jobs(
      job_id: snapshot['job_id'],
      job_name: snapshot['job_name'],
      num_of_recruit: snapshot['num_of_recruit'],
      job_gender: snapshot['job_gender'],
      corp_id: snapshot['corp_id'],
      work_address: snapshot['work_address'],
      job_description: snapshot['job_description'],
      career_id: snapshot['career_id'],
      exp_id: snapshot['exp_id'],
      employer_id: snapshot['employer_id'],
      province_id: snapshot['province_id'],
      lever_id: snapshot['lever_id'],
      way_to_work_id: snapshot['way_to_work_id'],
      salary_id: snapshot['salary_id'],
      state: snapshot['state'],
      image: snapshot['image'],
      deadline: snapshot['deadline'],
      created_at: (snapshot['created_at'] as Timestamp).toDate(),
    );
  }
}
