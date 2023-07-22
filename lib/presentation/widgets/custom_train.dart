import 'package:flutter/material.dart';
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
    return Column(
      children: [
        ListTile(
          leading: Image.asset(AppList.search[index]["image"], scale: index == 2 ? 9 : 5),
          title: Text(
            AppList.search[index]["data1"],
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038),
          ),
          subtitle: Text(
            tr == 0 ? AppList.trainumber[index] : AppString.economy,
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
                          AppList.search[index]["data2"],
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
                                      "\$${AppList.search[index]["data2"]}",
                                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                                    )
                                  ],
                                ),
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  le == 0 ? select.toString() : AppString.apex,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                  child: Text(
                    AppList.search[index]["data3"],
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
              children: [
                Image.asset(AppImages.searchicon, scale: 12),
                Text(
                  AppList.search[index]["data5"],
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
                    AppList.search[index]["data4"],
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
        )
      ],
    );
  }
}
