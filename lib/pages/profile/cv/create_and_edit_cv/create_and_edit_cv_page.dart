// ignore_for_file: must_be_immutable, annotate_overrides, non_constant_identifier_names, unused_element

import 'package:dng_freelance_jobs/models/employee.dart';
import 'package:dng_freelance_jobs/pages/profile/cv/create_and_edit_cv/create_and_edit_cv_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CreateAndEditCVPage extends GetWidget<CreateAndEditCVController> {
  final Employee employee;
  CreateAndEditCVPage({super.key, required this.employee});
  List items = [];
  var controller = Get.put(CreateAndEditCVController());
  var CV_ID = 'CV_ID';
  var FILE_NAME = 'FILE_NAME';
  var CV_NAME = 'JOB_GENDER';
  var ID_USER = 'CORP_ID';
  var CAREER_ID = 'CAREER_ID';
  var EXP_ID = 'EXP_ID';
  final TextEditingController _txtFileNameController = TextEditingController();
  final TextEditingController _txtCVNameController = TextEditingController();
  final TextEditingController _txtCareerIDController = TextEditingController();
  final TextEditingController _txtEXPIDController = TextEditingController();

  inputController(TYPE) {
    if (TYPE == FILE_NAME) {
      return _txtFileNameController;
    } else if (TYPE == CV_NAME) {
      return _txtCVNameController;
    } else if (TYPE == CAREER_ID) {
      return _txtCareerIDController;
    } else if (TYPE == EXP_ID) {
      return _txtEXPIDController;
    }
  }

  inputHintText(TYPE) {
    if (TYPE == FILE_NAME) {
      return "file name: ";
    } else if (TYPE == CV_NAME) {
      return "cv name";
    }else if (TYPE == CAREER_ID) {
      return "career";
    } else if (TYPE == EXP_ID) {
      return "exp ";
    }
  }

  inputIcon(TYPE) {
    if (TYPE == FILE_NAME) {
      return const Icon(Icons.abc);
    } else if (TYPE == CV_NAME) {
      return const Icon(Icons.person);
    } else if (TYPE == CAREER_ID) {
      return const Icon(Icons.numbers);
    } else if (TYPE == EXP_ID) {
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CreateAndEditCVController>(
        builder: (_) => CustomScrollView(slivers: [
          SliverAppBar(
            titleSpacing: 0,
            backgroundColor: Colors.grey[100],
            elevation: 0,
            pinned: true,
            centerTitle: false,
            expandedHeight: 200,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                        "https://blog.topcv.vn/wp-content/uploads/2018/09/fpt-software.png"),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "FPT Software",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[100],
              child: const Text(
                "CREATE A NEW CV",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _renderInput(FILE_NAME),
          _renderInput(CV_NAME),
          _renderInput(CAREER_ID),
          _renderInput(EXP_ID),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: ElevatedButton(
              onPressed: () {
                var cv_id = const Uuid().v4();
                controller.createAndEditCV(
                  cv_id.toString(),
                  _txtFileNameController.text,
                  _txtCVNameController.text,
                  employee.id_user,
                  _txtCareerIDController.text,
                  _txtEXPIDController.text
                );
                Get.snackbar('Create CV', 'Success');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              child: const Text('Create CV'),
            ),
          ))
        ]),
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
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextField(
          controller: inputController(TYPE),
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
