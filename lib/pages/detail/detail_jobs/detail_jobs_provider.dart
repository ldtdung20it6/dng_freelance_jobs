import 'package:cloud_firestore/cloud_firestore.dart';

class DetailJobsProvider {
  Future<void> applyJob(
    String application_id,
    String employee_id,
    String cv_id,
    String introduce,
    String job_id,
  ) async{
    try{
      try {
      await FirebaseFirestore.instance.collection('applications').doc(cv_id).set({
        'application_id': application_id,
        'employee_id': employee_id,
        'cv_id': cv_id,
        'introduce': introduce,
        'job_id': job_id,
      });
    } catch (e) {
      rethrow;
    }
    }catch(e){}
  }
}
