// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Employee {
  final String id_employee;
  final String full_name;
  final String gender;
  final String phone_number;
  final String image;
  final String id_user;
  Employee({
    required this.id_employee,
    required this.full_name,
    required this.gender,
    required this.phone_number,
    required this.image,
    required this.id_user,
  });
  factory Employee.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Employee(
      id_employee: snapshot['id_employee'],
      full_name: snapshot['full_name'],
      gender: snapshot['gender'],
      phone_number: snapshot['phone_number'],
      image: snapshot['image'],
      id_user: snapshot['id_user'],
    );
  }
}
