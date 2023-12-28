import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dng_freelance_jobs/models/jobs.dart';

class HomeProvider {
  Future<List<Jobs>> getAllJobs() async {
    // try {
      var querySnapshot =
          await FirebaseFirestore.instance.collection('jobs').get();
      var documents = querySnapshot.docs;
      List<Jobs> jobsList = [];
      for (var document in documents) {
        jobsList.add(Jobs.fromSnap(document));
      }
      return jobsList;
    // } catch (e) {
    //   print('Error getting jobs: $e');
    //   return [];
    // }
  }
}
