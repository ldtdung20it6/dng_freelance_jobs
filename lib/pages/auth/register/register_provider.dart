// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dng_freelance_jobs/utils/const.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterProvider {
  Future<User?> register(user_name, email, password, role) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'id_user': userCredential.user!.uid,
          'user_name': user_name,
          'email': email,
          'role': role,
          'created_at': DateTime.now(),
          'verify': Const.DefaultVerify,
          'verify_code': Const.DefaultVerify_Code,
        });
        if (role == "Employee") {
          await FirebaseFirestore.instance
              .collection('employees')
              .doc(user.uid)
              .set({
            'id_user': userCredential.user!.uid,
            'id_employee': userCredential.user!.uid,
            'full_name': "",
            'gender': "",
            'phone_number': "",
            'image': Const.DefaultAvatar,
          });
        } else if (role == "Employer") {
          await FirebaseFirestore.instance
              .collection('employers')
              .doc(user.uid)
              .set({
            'id_user': userCredential.user!.uid,
            'id_employer': userCredential.user!.uid,
            'full_name': "",
            'gender': "",
            'phone_number': "",
            'image': Const.DefaultAvatar,
            'id_corporation': "",
          });
        }
      }
      return userCredential.user;
    } catch (e) {
      print('Đăng ký thất bại: $e');
      return null;
    }
  }
}
