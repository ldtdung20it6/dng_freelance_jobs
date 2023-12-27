// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';

class EditprofileProvider {
  Future<void> updateEmployee(String id, String full_name, String gender,
      String image, String phone_number) async {
    try {
      var updateData = await FirebaseFirestore.instance
          .collection('employees')
          .doc(id)
          .update({
        'full_name': full_name,
        'gender': gender,
        'image': image,
        'phone_number': phone_number
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateEmployer(String id, String full_name, String gender,
      String image, String phone_number) async {
    try {
      var updateData = await FirebaseFirestore.instance
          .collection('employers')
          .doc(id)
          .update({
        'full_name': full_name,
        'gender': gender,
        'image': image,
        'phone_number': phone_number
      });
    } catch (e) {
      rethrow;
    }
  }
}
