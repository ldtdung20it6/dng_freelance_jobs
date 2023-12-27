// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';

class Way_to_work {
  final String way_to_work_id;
  final String way_to_work_name;
  Way_to_work({
    required this.way_to_work_id,
    required this.way_to_work_name,
  });
  factory Way_to_work.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Way_to_work(
      way_to_work_id: snapshot['way_to_work_id'],
      way_to_work_name: snapshot['way_to_work_name'],
    );
  }
}
