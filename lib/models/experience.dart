// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Experience {
  final String exp_id;
  final String exp_name;
  Experience({
    required this.exp_id,
    required this.exp_name,
  });
  factory Experience.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Experience(
      exp_id: snapshot['exp_id'],
      exp_name: snapshot['exp_name'],
    );
  }
}
