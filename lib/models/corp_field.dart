// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Corp_field {
  final String field_id;
  final String field_name;
  Corp_field({
    required this.field_id,
    required this.field_name,
  });
  factory Corp_field.fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String,dynamic>;
    return Corp_field(field_id: snapshot['field_id'], field_name: snapshot['field_name'],);
  }
}
