// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dng_freelance_jobs/models/employee.dart';
import 'package:dng_freelance_jobs/models/employer.dart';
import 'package:dng_freelance_jobs/models/users.dart' as models;
import 'package:firebase_auth/firebase_auth.dart';

class ProfileProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<models.Users?> getUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser!.uid).get();
    return models.Users.fromSnap(documentSnapshot);
  }

  Future<Employee?> getEmployeeByUserId(String userId) async {
    QuerySnapshot employeeQuery = await _firestore
        .collection('employees')
        .where('id_user', isEqualTo: userId)
        .get();
    return Employee.fromSnap(employeeQuery.docs.first);
  }

  Future<Employer?> getEmployerByUserId(String userId) async {
    QuerySnapshot employerQuery = await _firestore
        .collection('employers')
        .where('id_user', isEqualTo: userId)
        .get();
    return Employer.fromSnap(employerQuery.docs.first);
  }
}
