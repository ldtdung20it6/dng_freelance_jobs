// ignore_for_file: must_be_immutable, non_constant_identifier_names, annotate_overrides, unnecessary_null_comparison

// import 'package:dng_freelance_jobs/models/employee.dart';
// import 'package:dng_freelance_jobs/models/employer.dart';
import 'package:dng_freelance_jobs/pages/profile/edit_profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends GetWidget<EditProfileController> {
  var controller = Get.put(EditProfileController());
  // final Employee employee;
  // final Employer employer;

  EditProfilePage({
    super.key,
    // required this.employee,
    // required this.employer,
  });

  var ID_EMPLOYEE_OR_EMPLOYER = 'ID_EMPLOYEE_OR_EMPLOYER';
  var FULL_NAME = 'FULL_NAME';
  var GENDER = 'GENDER';
  var PHONE_NUMBER = 'PHONE_NUMBER';
  var IMAGE = 'IMAGE';
  var EMAIL = 'EMAIL';
  final TextEditingController _txtFullNameController = TextEditingController();
  final TextEditingController _txtgenderController = TextEditingController();
  final TextEditingController _txtPhoneNumberController =
      TextEditingController();

  inputController(TYPE) {
    if (TYPE == FULL_NAME) {
      return _txtFullNameController;
    } else if (TYPE == GENDER) {
      return _txtgenderController;
    } else if (TYPE == PHONE_NUMBER) {
      return _txtPhoneNumberController;
    }
  }

  inputHintText(TYPE) {
    if (controller.profileController.employee.value != null) {
      if (TYPE == ID_EMPLOYEE_OR_EMPLOYER) {
        return "My ID: ${controller.profileController.employee.value!.id_user}";
      } else if (TYPE == FULL_NAME) {
        return "Full name: ${controller.profileController.employee.value!.full_name}";
      } else if (TYPE == GENDER) {
        return "gender: ${controller.profileController.employee.value!.gender}";
      } else if (TYPE == PHONE_NUMBER) {
        return "Phone number: ${controller.profileController.employee.value!.phone_number}";
      } else if (TYPE == IMAGE) {
        return "Avatar";
      } else if (TYPE == EMAIL) {
        return "Email: ";
      }
    } else {
      if (TYPE == ID_EMPLOYEE_OR_EMPLOYER) {
        return "My ID: ${controller.profileController.employer.value!.id_user}";
      } else if (TYPE == FULL_NAME) {
        return "Full name: ${controller.profileController.employer.value!.full_name}";
      } else if (TYPE == GENDER) {
        return "gender: ${controller.profileController.employer.value!.gender}";
      } else if (TYPE == PHONE_NUMBER) {
        return "Phone number: ${controller.profileController.employer.value!.phone_number}";
      } else if (TYPE == IMAGE) {
        return "Avatar";
      } else if (TYPE == EMAIL) {
        return "Email: ";
      }
    }
  }

  inputIcon(TYPE) {
    if (TYPE == ID_EMPLOYEE_OR_EMPLOYER) {
      return const Icon(Icons.person);
    } else if (TYPE == FULL_NAME) {
      return const Icon(Icons.abc);
    } else if (TYPE == GENDER) {
      return const Icon(Icons.person);
    } else if (TYPE == PHONE_NUMBER) {
      return const Icon(Icons.phone);
    } else if (TYPE == IMAGE) {
      return const Icon(Icons.image);
    } else if (TYPE == EMAIL) {
      return const Icon(Icons.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleSpacing: 0,
            backgroundColor: Colors.grey[100],
            elevation: 0,
            pinned: true,
            centerTitle: false,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
                background: const Image(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
                title: controller.profileController.employee.value != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage(controller
                                .profileController.employee.value!.image),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            controller
                                .profileController.employee.value!.full_name,
                            style: const TextStyle(fontSize: 10),
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage(controller
                                .profileController.employer.value!.image),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            controller
                                .profileController.employer.value!.full_name,
                            style: const TextStyle(fontSize: 10),
                          )
                        ],
                      )),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[100],
              child: const Text(
                "My Personal",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _renderInput(ID_EMPLOYEE_OR_EMPLOYER),
          _renderInput(FULL_NAME),
          _renderInput(GENDER),
          _renderInput(PHONE_NUMBER),
          _renderInput(EMAIL),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: ElevatedButton(
              onPressed: () {
                if (controller.profileController.employee.value != null) {
                  controller.updateInfoEmployee(
                    controller.profileController.employee.value!,
                    _txtFullNameController.text,
                    _txtgenderController.text,
                    controller.profileController.employee.value!.image,
                    _txtPhoneNumberController.text,
                  );
                }else{
                  controller.updateInfoEmployer(
                    controller.profileController.employer.value!,
                    _txtFullNameController.text,
                    _txtgenderController.text,
                    controller.profileController.employer.value!.image,
                    _txtPhoneNumberController.text,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              child: const Text('Update'),
            ),
          ))
        ],
      ),
    );
  }

  Widget _renderInput(TYPE) {
    return SliverToBoxAdapter(
      child: Column(children: [
        _Input(TYPE),
        const SizedBox(
          height: 8,
        )
      ]),
    );
  }

  Widget _Input(String TYPE) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color:
              TYPE == ID_EMPLOYEE_OR_EMPLOYER ? Colors.grey[200] : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextField(
          controller: inputController(TYPE),
          enabled: TYPE == ID_EMPLOYEE_OR_EMPLOYER ? false : true,
          decoration: InputDecoration(
            icon: inputIcon(TYPE),
            hintText: inputHintText(TYPE),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
