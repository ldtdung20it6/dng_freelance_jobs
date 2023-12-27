// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Lever {
  final String lever_id;
  final String lever_name;
  Lever({
    required this.lever_id,
    required this.lever_name,
  });
  factory Lever.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Lever(
      lever_id: snapshot['lever_id'],
      lever_name: snapshot['lever_name'],
    );
  }
}
