// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String? id_user;
  final String? username;
  final String? email;
  final String? role;
  final DateTime? created_at;
  final String? verify;
  final String? verify_code;
  Users(
      {required this.id_user,
      required this.username,
      required this.email,
      required this.role,
      required this.created_at,
      required this.verify,
      required this.verify_code});

  factory Users.fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return Users(
      id_user: snapshot["id_user"],
      username: snapshot["user_name"],
      email: snapshot["email"],
      role: snapshot["role"],
      created_at: (snapshot["created_at"] as Timestamp).toDate(),
      verify: snapshot["verify"],
      verify_code: snapshot["verify_code"],
    );
  }
}
