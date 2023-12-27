// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Career {
  final String career_id;
  final String career_name;
  Career({required this.career_id, required this.career_name});
  factory Career.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Career(
      career_id: snapshot['career_id'],
      career_name: snapshot['career_name'],
    );
  }
}
