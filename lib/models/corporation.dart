// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Corporation {
  final String corp_id;
  final String corp_name;
  final String description;
  final String image;
  final String website;
  final String address;
  final String corp_field_id;
  Corporation({
    required this.corp_id,
    required this.corp_name,
    required this.description,
    required this.image,
    required this.website,
    required this.address,
    required this.corp_field_id,
  });
  factory Corporation.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Corporation(
      corp_id: snapshot['corp_id'],
      corp_name: snapshot['corp_name'],
      description: snapshot['description'],
      image: snapshot['image'],
      website: snapshot['website'],
      address: snapshot['address'],
      corp_field_id: snapshot['corp_field_id'],
    );
  }
}
