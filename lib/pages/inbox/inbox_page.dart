// ignore_for_file: must_be_immutable, annotate_overrides

import 'package:dng_freelance_jobs/pages/inbox/inbox_controller.dart';
import 'package:dng_freelance_jobs/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxPage extends GetWidget<InboxController> {
  var controller = Get.put(InboxController());
  InboxPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inbox',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _renderInbox(
                    Const.DefaultAvatar, 'test_user_name', 'test_inbox')
              ],
            ),
          )),
    );
  }

  Widget _renderInbox(userAvatar, userName, descriptInbox) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(children: [
        CircleAvatar(
          backgroundImage: NetworkImage(userAvatar),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(descriptInbox),
          ],
        )
      ]),
    );
  }
}
