
import 'package:dng_freelance_jobs/pages/auth/register/register_provider.dart';
import 'package:dng_freelance_jobs/routes/app_routes.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  void register(user_name,email,password,repeatPassword,role) {
    if (password == repeatPassword) {
      RegisterProvider().register(user_name,email, password,role).then((user) {
        if (user != null) {
          Get.snackbar('Đăng ký thành công', 'Success');
          Get.offAllNamed(AppRoutes.DASHBOARD);
        } else {
          Get.snackbar('Đăng ký thất bại', 'Error');
        }
      });
    } else {
      Get.snackbar('Mật khẩu không khớp', 'Error');
    }
  }
}
