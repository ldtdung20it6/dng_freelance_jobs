// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class CV {
  final String cv_id;
  final String file_name;
  final String cv_name;
  final String id_user;
  final String career_id;
  final String exp_id;
  final DateTime created_at;
  CV({
    required this.cv_id,
    required this.file_name,
    required this.cv_name,
    required this.id_user,
    required this.career_id,
    required this.exp_id,
    required this.created_at,
  });
  factory CV.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CV(
      cv_id: snapshot['cv_id'],
      file_name: snapshot['file_name'],
      cv_name: snapshot['cv_name'],
      id_user: snapshot['id_user'],
      career_id: snapshot['career_id'],
      exp_id: snapshot['exp_id'],
      created_at: snapshot['created_at'],
    );
  }
}
