import 'package:firebase_auth/firebase_auth.dart';
import 'package:dng_freelance_jobs/routes/app_routes.dart';
import 'package:get/get.dart';


class LoginController extends GetxController{
  Future<void> login(email, password) async {
    try {
      var UserCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (UserCredential.user?.uid != null) {
        Get.snackbar('Login', 'Success');
        Get.offAllNamed(AppRoutes.DASHBOARD);
      }else{
        Get.snackbar('Login False', 'Error');
      }
    } catch (e) {
      print(e);
    }
  }
}