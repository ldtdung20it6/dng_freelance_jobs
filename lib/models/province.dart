// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Province {
  final String province_id;
  final String province_name;
  Province({
    required this.province_id,
    required this.province_name,
  });
  factory Province.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Province(
      province_id: snapshot['province_id'],
      province_name: snapshot['province_name'],
    );
  }
}
