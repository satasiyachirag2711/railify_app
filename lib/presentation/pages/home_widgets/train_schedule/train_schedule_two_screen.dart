import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:railify_app/presentation/pages/home_widgets/train_schedule/train_schedule_details_screen.dart';
import 'package:railify_app/presentation/widgets/custom_train.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';

class TrainScheduleTwo extends StatefulWidget {
  final String title;
  final String select;
  final String starttime;
  final String endtime;
  const TrainScheduleTwo({super.key, required this.title, required this.select, required this.starttime, required this.endtime});

  @override
  State<TrainScheduleTwo> createState() => _TrainScheduleTwoState();
}

class _TrainScheduleTwoState extends State<TrainScheduleTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        bottom: AppBar(
            leading: const SizedBox(),
            leadingWidth: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                ),
              )
            ],
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(widget.select, style: TextStyle(fontSize: Get.width * 0.04)), Text("${widget.starttime} - ${widget.endtime}", style: TextStyle(height: 1.5, fontSize: Get.width * 0.04))],
            )),
      ),
      body: SizedBox(
          height: Get.height * 1.3,
          child: ListView.builder(
            itemCount: AppList.search.length,
            itemBuilder: (context, index) => Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.off(TrainScheduleDetailsScreen(
                      subtitle: AppList.search[index]["data5"],
                      image: AppList.search[index]["image"],
                      title: AppList.search[index]["data1"],
                      apptitle: widget.title,
                      stationone: widget.select,
                      stationtwo: AppList.trainschedule[index],
                      number: AppList.trainumber[index],
                      time: AppList.search[index]["data3"],
                      timetwo: AppList.search[index]["data4"],
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                    height: Get.height * 0.2,
                    child: CustomTrain(index: index, tr: 0, le: 0, select: widget.select),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
