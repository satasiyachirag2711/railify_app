import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';

class AboutRailifyScreen extends StatefulWidget {
  final String name;

  const AboutRailifyScreen({super.key, required this.name});

  @override
  State<AboutRailifyScreen> createState() => _AboutRailifyScreenState();
}

class _AboutRailifyScreenState extends State<AboutRailifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.04,
              ),
              Image.asset(AppImages.train_logo, scale: 6),
              Text(
                AppString.railify,
                style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.bold, height: 3),
              ),
              Divider(height: 20),
              SizedBox(
                height: Get.height * 0.5,
                child: ListView.builder(
                  itemCount: AppList.about.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(AppList.about[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.035)), Icon(Icons.arrow_forward_ios_rounded)],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
