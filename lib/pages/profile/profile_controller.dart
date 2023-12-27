// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:dng_freelance_jobs/models/employee.dart';
import 'package:dng_freelance_jobs/models/employer.dart';
import 'package:dng_freelance_jobs/models/users.dart' as models;
import 'package:dng_freelance_jobs/pages/profile/profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<models.Users?> user = Rx<models.Users?>(null);
  Rx<Employee?> employee = Rx<Employee?>(null);
  Rx<Employer?> employer = Rx<Employer?>(null);

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  setUser(models.Users newUser) {
    user.value = newUser;
  }

  setEmployee(Employee newEmployee) {
    employee.value = newEmployee;
  }

  setEmployer(Employer newEmployer) {
    employer.value = newEmployer;
  }

  Future<void> loadUserData() async {
    try {
      models.Users? userData = await ProfileProvider().getUser();
      setUser(userData!);
    } catch (e) {
      print('Error loading user data: $e');
    }
  }

  Future<void> loadEmployeeData() async {
    try {
      models.Users? currentUser = user.value;
        Employee? employeeData = await ProfileProvider()
            .getEmployeeByUserId(currentUser!.id_user.toString());
        setEmployee(employeeData!);
    } catch (e) {
      print('Error loading employee data: $e');
    }
  }

  Future<void> loadEmployerData() async {
    try {
      models.Users? currentUser = user.value;
        Employer? employerData = await ProfileProvider()
            .getEmployerByUserId(currentUser!.id_user.toString());
        setEmployer(employerData!);
    } catch (e) {
      print('Error loading employer data: $e');
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
