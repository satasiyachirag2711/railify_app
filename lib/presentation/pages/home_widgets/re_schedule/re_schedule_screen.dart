import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/re_schedule/select_new_schedule.dart';
import 'package:railify_app/presentation/widgets/custom_train.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';

class ReScheduleScreen extends StatefulWidget {
  const ReScheduleScreen({super.key});

  @override
  State<ReScheduleScreen> createState() => _ReScheduleScreenState();
}

class _ReScheduleScreenState extends State<ReScheduleScreen> {
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
                  SelectNewSchedule(
                    title: AppList.search[index]["data1"],
                    image: AppList.search[index]["image"],
                    subtitle: AppList.search[index]["data5"],
                    leading: AppList.search[index]["data3"],
                    date: DateFormat('dd MMMM yyyy').format(global.selectedDate),
                    trailingtwo: AppList.search[index]["data4"],
                  ),
                );
              },
              child: Container(margin: const EdgeInsets.all(15), decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)), height: Get.height * 0.2, child: CustomTrain(index: index, tr: 2)),
            ),
          ],
        ),
      ),
    );
  }
}
