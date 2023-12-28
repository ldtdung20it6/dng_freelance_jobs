import 'package:cloud_firestore/cloud_firestore.dart';

class CVProvider {
  Future<void> createAndEditCV(
      cv_id, file_name, cv_name, id_user, career_id, exp_id) async {
    try {
      await FirebaseFirestore.instance.collection('cv').doc(cv_id).set({
        'cv_id': cv_id,
        'file_name': file_name,
        'cv_name': cv_name,
        'id_user': id_user,
        'career_id': career_id,
        'exp_id': exp_id,
        'created_at': DateTime.now()
      });
    } catch (e) {
      rethrow;
    }
  }
}