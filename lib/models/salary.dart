// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Salary {
  final String salary_id;
  final String salary_name;
  Salary({
    required this.salary_id,
    required this.salary_name,
  });
  factory Salary.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Salary(
      salary_id: snapshot['salary_id'],
      salary_name: snapshot['salary_name'],
    );
  }
}
