// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Application {
  final String application_id;
  final String employee_id;
  final String cv_id;
  final String introduce;
  final String job_id;
  Application({
    required this.application_id,
    required this.employee_id,
    required this.cv_id,
    required this.introduce,
    required this.job_id,
  });
  factory Application.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Application(
      application_id: snapshot['application_id'],
      employee_id: snapshot['employee_id'],
      cv_id: snapshot['cv_id'],
      introduce: snapshot['introduce'],
      job_id: snapshot['job_id'],
    );
  }
}
