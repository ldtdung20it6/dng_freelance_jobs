import 'package:dng_freelance_jobs/pages/profile/cv/create_and_edit_cv/create_and_edit_cv_provider.dart';
import 'package:get/get.dart';

class CreateAndEditCVController extends GetxController {
  void createAndEditCV(
    String cv_id,
    String file_name,
    String cv_name,
    String id_user,
    String career_id,
    String exp_id,
  ) async {
    await CVProvider()
        .createAndEditCV(
          cv_id,
          file_name,
          cv_name,
          id_user,
          career_id,
          exp_id,
        )
        .then((value) => {})
        .catchError((onError) {
      print(onError);
    });
  }
}
