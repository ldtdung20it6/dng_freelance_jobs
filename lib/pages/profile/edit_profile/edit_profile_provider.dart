// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image/image.dart' as img;

class EditprofileProvider {
  Future<void> updateEmployee(String id, String full_name, String gender,
      String image, String phone_number) async {
    try {
      
        var updateData = await FirebaseFirestore.instance
            .collection('employees')
            .doc(id)
            .update({
          'full_name': full_name,
          'gender': gender,
          'image': image,
          'phone_number': phone_number
        });
      
    } catch (e) {}
  }

  Future<void> updateEmployer(String id, String full_name, String gender,
      String image, String phone_number) async {
    try {
      var updateData = await FirebaseFirestore.instance
          .collection('employers')
          .doc(id)
          .update({
        'full_name': full_name,
        'gender': gender,
        'image': image,
        'phone_number': phone_number
      });
    } catch (e) {
      rethrow;
    }
  }

  // File convertToJpg(File originalImage) {
  //   final imageBytes = originalImage.readAsBytesSync();
  //   final image = img.decodeImage(imageBytes);
  //   if (image == null) {
  //     throw Exception('Failed to decode the image.');
  //   }
  //   final jpgImage = img.encodeJpg(image, quality: 100);
  //   return File(originalImage.path.replaceAll(RegExp(r'\..+$'), '.jpg'))
  //     ..writeAsBytesSync(jpgImage);
  // }

  // void uploadAndSaveAsJpg(File originalImage) async {
  //   final jpgImage = convertToJpg(originalImage);
  //   final imageUrl = await uploadAvatar(jpgImage);
  // }

  // Future<String?> uploadAvatar(File imageFile) async {
  //   try {
  //     final Reference storageReference =
  //         FirebaseStorage.instance.ref().child('avatars/$userId.jpg');
  //     final UploadTask uploadTask = storageReference.putFile(imageFile);
  //     await uploadTask.whenComplete(() => null);
  //     final String imageUrl = await storageReference.getDownloadURL();
  //     return imageUrl;
  //   } catch (e) {
  //     print('Error uploading avatar: $e');
  //     return null;
  //   }
  // }
}
