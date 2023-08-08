import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/utils/App_list.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_images.dart';
import 'package:railify_app/utils/app_string.dart';

class CustomTrain extends StatelessWidget {
  int index;
  int? tr;
  int? le;
  String? select;
  CustomTrain({super.key, required this.index, this.tr, this.le, this.select});
  GlobleController global = Get.find();
  @override
  Widget build(BuildContext context) {
    global.getUsers();
    double randomValue1 = Random().nextDouble() * 12.0;
    double randomValue2 = Random().nextDouble() * 12.0;
    String formattedRandomTime1 = DateFormat('HH:mm').format(DateTime.utc(0, 1, 1).add(Duration(hours: (randomValue1 + 8).toInt(), minutes: ((randomValue1 - (randomValue1 + 8).toInt()) * 60).toInt())));
    String formattedRandomTime2 = DateFormat('HH:mm').format(DateTime.utc(0, 1, 1).add(Duration(hours: (randomValue2 + 8).toInt(), minutes: ((randomValue2 - (randomValue2 + 8).toInt()) * 60).toInt())));
    return Column(
      children: [
        Column(
          children: [
            ListTile(
              leading: Image.asset(index % 2 == 0 ? "assets/images/search_one.jpeg" : "assets/images/search_two.png"),
              title: Text(
                global.data[index].contains('- -') ? global.data[index].toString().split('- -').last : global.data[index].toString().split('-').last,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038),
              ),
              subtitle: Text(
                tr == 0 ? global.data.toString().split('/').first : AppString.economy,
                style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
              ),
              trailing: tr == 0
                  ? SizedBox()
                  : tr == 1
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$${Random().nextInt(61) + 20}",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                            ),
                            Text(
                              "Seat Available",
                              style: TextStyle(color: AppColor.black54, fontWeight: FontWeight.bold, fontSize: Get.width * 0.028),
                            ),
                          ],
                        )
                      : tr == 2
                          ? ElevatedButton(onPressed: () {}, child: const Text("Paid"))
                          : tr == 3
                              ? ElevatedButton(
                                  onPressed: () {},
                                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
                                  child: Text(AppString.completed, style: TextStyle(fontSize: Get.width * 0.025)),
                                )
                              : tr == 4
                                  ? ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red.shade400)),
                                      child: Text("Canceled", style: TextStyle(fontSize: Get.width * 0.03)),
                                    )
                                  : Wrap(
                                      children: [
                                        Text(
                                          "Available",
                                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: Get.width * 0.028),
                                        ),
                                        SizedBox(width: Get.width * 0.04),
                                        Text(
                                          "\$${Random().nextInt(61) + 20}",
                                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                                        )
                                      ],
                                    ),
            ),
            const Divider(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        le == 0 ? select.toString() : AppString.apex,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.032),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                        child: Text(
                          formattedRandomTime1,
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                        ),
                      ),
                      Text(
                        DateFormat('dd MMMM yyyy').format(global.selectedDate),
                        style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.searchicon, scale: 12),
                      Text(
                        "Duration 1h 30m",
                        style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        le == 0 ? AppList.trainschedule[index] : AppString.proxima,
                        style: TextStyle(fontSize: Get.width * 0.034),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                        child: Text(
                          formattedRandomTime2,
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                        ),
                      ),
                      Text(
                        DateFormat('dd MMMM yyyy').format(global.selectedDate),
                        style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
