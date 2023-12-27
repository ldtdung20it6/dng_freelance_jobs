// ignore_for_file: must_be_immutable, annotate_overrides, non_constant_identifier_names

import 'package:dng_freelance_jobs/pages/profile/corporation/create_and_edit_job/create_and_edit_job_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAndEditJobPage extends GetWidget<EditJobController> {
  var controller = Get.put(EditJobController());
  CreateAndEditJobPage({super.key});
  var JOB_NAME = 'JOB_NAME';
  var NUM_OF_RECRUIT = 'NUM_OF_RECRUIT';
  var JOB_GENDER = 'JOB_GENDER';
  var CORP_ID = 'CORP_ID';
  var WORK_ADDRESS = 'WORK_ADDRESS';
  var JOB_DESCRIPTION = 'JOB_DESCRIPTION';
  var CAREER_ID = 'CAREER_ID';
  var EXP_ID = 'EXP_ID';
  var EMPLOYER_ID = 'EMPLOYER_ID';
  var PROVINCE_ID = 'PROVINCE_ID';
  var LEVER_ID = 'LEVER_ID';
  var WAY_TO_WORK_ID = 'WAY_TO_WORK_ID';
  var SALARY_ID = 'SALARY_ID';
  var STATE = 'STATE';
  var DEADLINE = 'DEADLINE';
  final TextEditingController _txtJobNameController = TextEditingController();
  final TextEditingController _txtJobGenderController = TextEditingController();
  final TextEditingController _txtNumOfRecruitController =
      TextEditingController();
  final TextEditingController _txtCorpIDController = TextEditingController();
  final TextEditingController _txtWorkAddressController =
      TextEditingController();
  final TextEditingController _txtJobDescriptionController =
      TextEditingController();
  final TextEditingController _txtCareerIDController = TextEditingController();
  final TextEditingController _txtEXPIDController = TextEditingController();
  final TextEditingController _txtEmployerIDController =
      TextEditingController();
  final TextEditingController _txtprovinceIDController =
      TextEditingController();
  final TextEditingController _txtLeverIDController = TextEditingController();
  final TextEditingController _txtWayToWorkIDController =
      TextEditingController();
  final TextEditingController _txtSalaryIDController = TextEditingController();
  final TextEditingController _txtStateController = TextEditingController();
  final TextEditingController _txtDeadlineController = TextEditingController();

  inputController(TYPE) {
    if (TYPE == JOB_NAME) {
      return _txtJobNameController;
    } else if (TYPE == JOB_GENDER) {
      return _txtJobGenderController;
    } else if (TYPE == NUM_OF_RECRUIT) {
      return _txtNumOfRecruitController;
    } else if (TYPE == CORP_ID) {
      return _txtCorpIDController;
    } else if (TYPE == WORK_ADDRESS) {
      return _txtWorkAddressController;
    } else if (TYPE == JOB_DESCRIPTION) {
      return _txtJobDescriptionController;
    } else if (TYPE == CAREER_ID) {
      return _txtCareerIDController;
    } else if (TYPE == EXP_ID) {
      return _txtEXPIDController;
    } else if (TYPE == EMPLOYER_ID) {
      return _txtEmployerIDController;
    } else if (TYPE == PROVINCE_ID) {
      return _txtprovinceIDController;
    } else if (TYPE == LEVER_ID) {
      return _txtLeverIDController;
    } else if (TYPE == WAY_TO_WORK_ID) {
      return _txtWayToWorkIDController;
    } else if (TYPE == SALARY_ID) {
      return _txtSalaryIDController;
    } else if (TYPE == STATE) {
      return _txtStateController;
    } else if (TYPE == DEADLINE) {
      return _txtDeadlineController;
    }
  }

  inputHintText(TYPE) {
    if (TYPE == JOB_NAME) {
      return "Job name: ";
    } else if (TYPE == JOB_GENDER) {
      return "job gender";
    } else if (TYPE == NUM_OF_RECRUIT) {
      return "number of recruit";
    } else if (TYPE == CORP_ID) {
      return "Corporation";
    } else if (TYPE == WORK_ADDRESS) {
      return "work address";
    } else if (TYPE == JOB_DESCRIPTION) {
      return "job description";
    }else if (TYPE == CAREER_ID) {
      return "career";
    }else if (TYPE == EXP_ID) {
      return "exp ";
    }else if (TYPE == EMPLOYER_ID) {
      return "employer";
    }else if (TYPE == PROVINCE_ID) {
      return "province";
    }else if (TYPE == LEVER_ID) {
      return "lever";
    }else if (TYPE == WAY_TO_WORK_ID) {
      return "way to work ";
    }else if (TYPE == SALARY_ID) {
      return "salary";
    }else if (TYPE == STATE) {
      return "state";
    }else if (TYPE == DEADLINE) {
      return "deadline";
    }
  }

  inputIcon(TYPE) {
    if (TYPE == JOB_NAME) {
      return const Icon(Icons.abc);
    } else if (TYPE == JOB_GENDER) {
      return const Icon(Icons.person);
    } else if (TYPE == NUM_OF_RECRUIT) {
      return const Icon(Icons.numbers);
    } else if (TYPE == CORP_ID) {
      return const Icon(Icons.corporate_fare);
    } else if (TYPE == WORK_ADDRESS) {
      return const Icon(Icons.map_outlined);
    } else if (TYPE == JOB_DESCRIPTION) {
      return const Icon(Icons.description);
    }else if (TYPE == CAREER_ID) {
      return const Icon(Icons.carpenter);
    }else if (TYPE == EXP_ID) {
      return const Icon(Icons.expand);
    }else if (TYPE == EMPLOYER_ID) {
      return const Icon(Icons.person);
    }else if (TYPE == PROVINCE_ID) {
      return const Icon(Icons.privacy_tip_outlined);
    }else if (TYPE == LEVER_ID) {
      return const Icon(Icons.live_help_rounded);
    }else if (TYPE == WAY_TO_WORK_ID) {
      return const Icon(Icons.work);
    }else if (TYPE == SALARY_ID) {
      return const Icon(Icons.attach_money);
    }else if (TYPE == STATE) {
      return const Icon(Icons.open_in_browser);
    }else if (TYPE == DEADLINE) {
      return const Icon(Icons.timelapse_rounded);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
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
              "CREATE A NEW JOB",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        _renderInput(JOB_NAME),
        _renderInput(JOB_GENDER),
        _renderInput(NUM_OF_RECRUIT),
        _renderInput(CORP_ID),
        _renderInput(WORK_ADDRESS),
        _renderInput(JOB_DESCRIPTION),
        _renderInput(CAREER_ID),
        _renderInput(EXP_ID),
        _renderInput(EMPLOYER_ID),
        _renderInput(PROVINCE_ID),
        _renderInput(LEVER_ID),
        _renderInput(WAY_TO_WORK_ID),
        _renderInput(SALARY_ID),
        _renderInput(STATE),
        _renderInput(DEADLINE),
        SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0),
                          ),
                          child: const Text('Create Job'),
                        ),
              ))
      ]),
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
          // color:
          //     TYPE == ID_EMPLOYEE_OR_EMPLOYER ? Colors.grey[200] : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextField(
          controller: inputController(TYPE),
          // enabled: TYPE == ID_EMPLOYEE_OR_EMPLOYER ? false : true,
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
