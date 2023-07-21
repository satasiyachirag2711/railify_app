import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:railify_app/presentation/pages/home_widgets/train_storie_details.dart';
import 'package:railify_app/utils/app_images.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../utils/app_color.dart';

class OurNewStroiescreen extends StatefulWidget {
  const OurNewStroiescreen({super.key});

  @override
  State<OurNewStroiescreen> createState() => _OurNewStroiescreenState();
}

class _OurNewStroiescreenState extends State<OurNewStroiescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppString.ournewstorie),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Get.off(TrainStoriesDetails(hour: index == 0 || index == 2 ? AppString.hours : AppString.day, image: index == 0 || index == 2 ? AppImages.homeone : AppImages.hometwo, name: index == 1 || index == 3 ? "Train Derailment Causes Major\nDisruption to service No Causual..." : AppString.trainapp));
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(Get.width * 0.08)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(index == 0 || index == 2 ? AppImages.homeone : AppImages.hometwo), fit: BoxFit.cover),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(Get.width * 0.08),
                        ),
                      ),
                      height: Get.height * 0.25,
                      width: Get.width,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            AppString.trainapp,
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: Get.width * 0.035,
                              height: 1.6,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_right, color: AppColor.blue),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        index == 0 || index == 2 ? AppString.hours : AppString.day,
                        style: TextStyle(
                          color: AppColor.black54,
                          fontSize: Get.width * 0.032,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
