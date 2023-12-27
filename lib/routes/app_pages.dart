import 'package:dng_freelance_jobs/pages/auth/login/login_page.dart';
import 'package:dng_freelance_jobs/pages/auth/register/register_page.dart';
import 'package:dng_freelance_jobs/pages/create/create_page.dart';
import 'package:dng_freelance_jobs/pages/dash_board/dash_board_binding.dart';
import 'package:dng_freelance_jobs/pages/dash_board/dash_board_page.dart';
import 'package:dng_freelance_jobs/pages/home/home_page.dart';
import 'package:dng_freelance_jobs/pages/inbox/inbox_page.dart';
import 'package:dng_freelance_jobs/pages/manage_oders/manage_oders_page.dart';
import 'package:dng_freelance_jobs/pages/notifications/notifications_page.dart';
import 'package:dng_freelance_jobs/pages/profile/profile_page.dart';
import 'package:dng_freelance_jobs/pages/search/search_page.dart';
import 'package:dng_freelance_jobs/pages/splash/splash_page.dart';
import 'package:dng_freelance_jobs/pages/welcome/welcome_page.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages{
  static var list = [
    GetPage(name: AppRoutes.SPLASH, page: () =>  SplashPage()),
    GetPage(name: AppRoutes.WELCOME, page: () => WelcomePage()),
    GetPage(name: AppRoutes.DASHBOARD, page: () => DashBoardPage(),binding: DashboardBinding()),
    GetPage(name: AppRoutes.LOGIN, page: () => LoginPage()),
    GetPage(name: AppRoutes.REGISTER, page: () => RegisterPage()),
    GetPage(name: AppRoutes.HOME, page: () => HomePage()),
    GetPage(name: AppRoutes.SEARCH, page: () => SearchPage()),
    GetPage(name: AppRoutes.CREATE, page: () => CreatePage()),
    GetPage(name: AppRoutes.NOTIFICATION, page: () => NotificationPage()),
    GetPage(name: AppRoutes.PROFILE, page: () => ProfilePage()),
    GetPage(name: AppRoutes.INBOX, page: () => InboxPage()),
    GetPage(name: AppRoutes.MANAGE_ODERS, page: () => ManageOdersPage()),
  ];
}