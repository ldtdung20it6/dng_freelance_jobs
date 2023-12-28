import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dng_freelance_jobs/models/cv.dart';

class CVProvider{
  Future<List<CV>> getAllCV() async {
    try {
      var querySnapshot =
          await FirebaseFirestore.instance.collection('cv').get();
      var documents = querySnapshot.docs;
      List<CV> cv = [];
      for (var document in documents) {
        cv.add(CV.fromSnap(document));
      }
      return cv;
    } catch (e) {
      print('Error getting jobs: $e');
      return [];
    }
  }
}