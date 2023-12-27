// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Employer {
  final String id_employer;
  final String full_name;
  final String gender;
  final String phone_number;
  final String image;
  final String id_user;
  final String id_corporation;
  Employer({
    required this.id_employer,
    required this.full_name,
    required this.gender,
    required this.phone_number,
    required this.image,
    required this.id_user,
    required this.id_corporation,
  });
  factory Employer.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Employer(
      id_employer: snapshot['id_employer'],
      full_name: snapshot['full_name'],
      gender: snapshot['gender'],
      phone_number: snapshot['phone_number'],
      image: snapshot['image'],
      id_user: snapshot['id_user'],
      id_corporation: snapshot['id_corporation'],
    );
  }
}
