import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/train_cancellation/cancel_trip_screen.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';

class SelectTripScreen extends StatefulWidget {
  const SelectTripScreen({super.key});

  @override
  State<SelectTripScreen> createState() => _SelectTripScreenState();
}

class _SelectTripScreenState extends State<SelectTripScreen> {
  GlobleController global = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.selecttrip),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: AppList.search.length,
        itemBuilder: (context, index) => Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(
                  CancelTripScreen(
                    title: AppList.search[index]["data1"],
                    image: AppList.search[index]["image"],
                    subtitle: AppList.search[index]["data5"],
                    leading: AppList.search[index]["data3"],
                    date: DateFormat('dd MMMM yyyy').format(global.selectedDate),
                    trailingtwo: AppList.search[index]["data4"],
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                height: Get.height * 0.2,
                child: Column(
                  children: [
                    ListTile(
                        leading: Image.asset(AppList.search[index]["image"], scale: index == 2 ? 9 : 5),
                        title: Text(
                          AppList.search[index]["data1"],
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038),
                        ),
                        subtitle: Text(
                          AppString.economy,
                          style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                        ),
                        trailing: ElevatedButton(onPressed: () {}, child: const Text("Paid"))),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppString.apex,
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
                              AppString.proxima,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
