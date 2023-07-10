import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';

class PrivacyScreen extends StatefulWidget {
  final String name;

  const PrivacyScreen({super.key, required this.name});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.atRailifywerespect,
                style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.036),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                AppString.information,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.042),
              ),
              Text(
                AppString.whenyouuse,
                style: TextStyle(color: AppColor.black54, height: 1.6, fontSize: Get.width * 0.036),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  AppString.deviceinformation,
                  style: TextStyle(color: AppColor.black54, height: 1.6, fontSize: Get.width * 0.036),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                AppString.howeuse,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.042),
              ),
              Text(
                AppString.weuse,
                style: TextStyle(color: AppColor.black54, height: 1.6, fontSize: Get.width * 0.036),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  AppString.deviceinformation,
                  style: TextStyle(color: AppColor.black54, height: 1.6, fontSize: Get.width * 0.036),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
