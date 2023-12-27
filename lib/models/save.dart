// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Save {
  final String save_id;
  final String job_id;
  final String employee_id;
  Save({
    required this.save_id,
    required this.job_id,
    required this.employee_id,
  });
  factory Save.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Save(
      save_id: snapshot['save_id'],
      job_id: snapshot['job_id'],
      employee_id: snapshot['employee_id'],
    );
  }
}
