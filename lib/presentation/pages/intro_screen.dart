import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/models/intro_model.dart';
import 'package:railify_app/presentation/pages/one_boarder_screen.dart';
import 'package:railify_app/utils/app_color.dart';

import '../../utils/app_string.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  GlobleController global = Get.put(GlobleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            PageView.builder(
                onPageChanged: (value) {
                  global.currentIndex.value = value;
                },
                itemCount: listOfItems.length,
                itemBuilder: (context, index) {
                  return PageBuilderWidget(title: listOfItems[global.currentIndex.value].title, description: listOfItems[global.currentIndex.value].subTitle, imgurl: listOfItems[global.currentIndex.value].img);
                }),
            Positioned(
              bottom: Get.height * 0.3,
              left: Get.width * 0.44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  listOfItems.length,
                  (index) => buildDot(index: index),
                ),
              ),
            ),
            Positioned(
              bottom: Get.height * 0.12,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        global.currentIndex.value = listOfItems.length - 1;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade50,
                        padding: EdgeInsets.symmetric(vertical: 13, horizontal: Get.width * 0.16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(
                        AppString.Skip,
                        style: TextStyle(fontSize: Get.width * 0.04, color: AppColor.blue),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (global.currentIndex.value < listOfItems.length - 1) {
                          global.currentIndex.value++;
                        } else {
                          Get.off(const OneBoarderScreen());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 13, horizontal: Get.width * 0.16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(
                        AppString.Next,
                        style: TextStyle(fontSize: Get.width * 0.04),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 7,
      width: global.currentIndex.value == index ? 22 : 6,
      decoration: BoxDecoration(
        color: global.currentIndex.value == index ? AppColor.blue : AppColor.black54,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;

  PageBuilderWidget({Key? key, required this.title, required this.description, required this.imgurl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: Get.height * 0.04),
          Container(
            height: Get.height * 0.4,
            margin: const EdgeInsets.only(top: 40),
            child: Image.asset(
              imgurl,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: Get.width * 0.06,
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Get.height * 0.02),
          Text(description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.black54,
                height: 1.5,
                fontSize: Get.width * 0.032,
              ))
        ],
      ),
    );
  }
}
