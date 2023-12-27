// ignore_for_file: must_be_immutable, annotate_overrides

import 'package:dng_freelance_jobs/pages/detail/detail_corp/detail_corp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailCorpPage extends GetWidget<DetailCorpController> {
  var controller = Get.put(DetailCorpController());
  // final String urlImage;
  // final String userAvatar;
  // final String userName;
  // final String descriptJob;
  // final String priceJob;

  DetailCorpPage({
    Key? key,
    // required this.urlImage,
    // required this.userAvatar,
    // required this.userName,
    // required this.descriptJob,
    // required this.priceJob,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://blog.topcv.vn/wp-content/uploads/2018/09/fpt-software.png"),
                    radius: 64),
                const SizedBox(height: 16),
                const Text(
                  "FPT Software",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.near_me, size: 30),
                          SizedBox(width: 6),
                          Text("http://Fptsoftware.com")
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.map_outlined, size: 30),
                          SizedBox(width: 6),
                          Text("Nam Ky Khoi Nghia,Ngu Hanh Son,Da Nang")
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Description of the corporation ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text(
                      "FPT Software là công ty thành viên thuộc Tập đoàn FPT. Được thành lập từ năm 1999, FPT Software hiện là công ty chuyên cung cấp các dịch vụ và giải pháp phần mềm cho các khách hàng quốc tế, với hơn 28000 nhân viên, hiện diện tại 27 quốc gia trên toàn cầu. Nhiều năm liền, FPT Software được bình chọn là Nhà Tuyển dụng được yêu thích nhất và nằm trong TOP các công ty có môi trường làm việc tốt nhất châu Á."),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
