import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dng_freelance_jobs/models/application.dart';
import 'package:dng_freelance_jobs/models/jobs.dart';

class ApplicationProvider {
  Future<List<Application>> getAll() async {
    try {
      var querySnapshot =
          await FirebaseFirestore.instance.collection('applications').get();
      var documents = querySnapshot.docs;
      List<Application> application = [];
      for (var document in documents) {
        application.add(Application.fromSnap(document));
      }
      return application;
    } catch (e) {
      print('Error getting jobs: $e');
      return [];
    }
  }

   Future<Jobs?> getJobByID(String jobID) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference jobRef = firestore.collection('jobs').doc(jobID);
      DocumentSnapshot jobSnapshot = await jobRef.get();
      if (jobSnapshot.exists) {
        return Jobs.fromSnap(jobSnapshot);
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}