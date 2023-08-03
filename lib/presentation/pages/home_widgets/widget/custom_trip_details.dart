// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../../utils/app_images.dart';

class CustomTripDetails extends StatelessWidget {
  final String image;
  final String title;
  String? trailing;
  String? text;
  int? tr;
  final String date;
  final String leading;
  final String trailingtwo;
  final String subtitle;
  String? stationone;
  String? station;
  CustomTripDetails({super.key, required this.image, required this.title, this.trailing, required this.date, required this.leading, required this.trailingtwo, required this.subtitle, this.text, this.tr, this.station, this.stationone});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
        height: Get.height * 0.24,
        margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
        child: SingleChildScrollView(physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              ListTile(
                leading: Image.asset(image, scale: 5),
                title: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038),
                ),
                subtitle: Text(
                  tr == 3 ? "${station}-${stationone}" : AppString.economy,
                  style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                ),
                trailing: tr == 1
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            trailing ?? "",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                          ),
                          Text(
                            "Seat Available",
                            style: TextStyle(color: AppColor.black54, fontWeight: FontWeight.bold, fontSize: Get.width * 0.028),
                          ),
                        ],
                      )
                    : tr == 0
                        ? ElevatedButton(onPressed: () {}, child: const Text("Paid"))
                        : Wrap(
                            children: [
                              Text(
                                text ?? "Available",
                                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: Get.width * 0.028),
                              ),
                              SizedBox(width: Get.width * 0.04),
                              Text(
                                trailing ?? "",
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
                        tr == 3 ? station.toString() : AppString.apex,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                        child: Text(
                          leading,
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                        ),
                      ),
                      Text(
                        date,
                        style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(AppImages.searchicon, scale: 12),
                      Text(
                        subtitle,
                        style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        tr == 3 ? stationone.toString() : AppString.proxima,
                        style: TextStyle(fontSize: Get.width * 0.034),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                        child: Text(
                          trailingtwo,
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                        ),
                      ),
                      Text(
                        date,
                        style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
