import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/presentation/pages/home_widgets/train_schedule/train_schedule_details_screen.dart';
import 'package:railify_app/presentation/widgets/custom_train.dart';

import '../../../../controller/globle_controller.dart';
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
  GlobleController globle = Get.find();

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
            itemCount: globle.data.length,
            itemBuilder: (context, index) => Column(
              children: [
                GestureDetector(
                  onTap: () {
                    double randomValue1 = Random().nextDouble() * 12.0;
                    double randomValue2 = Random().nextDouble() * 12.0;
                    String formattedRandomTime1 = DateFormat('HH:mm').format(DateTime.utc(0, 1, 1).add(Duration(hours: (randomValue1 + 8).toInt(), minutes: ((randomValue1 - (randomValue1 + 8).toInt()) * 60).toInt())));
                    String formattedRandomTime2 = DateFormat('HH:mm').format(DateTime.utc(0, 1, 1).add(Duration(hours: (randomValue2 + 8).toInt(), minutes: ((randomValue2 - (randomValue2 + 8).toInt()) * 60).toInt())));

                    Get.off(TrainScheduleDetailsScreen(
                      title: globle.data[index].contains('- -') ? globle.data[index].toString().split('- -').last : globle.data[index].toString().split('-').last,
                      image: index % 2 == 0 ? "assets/images/search_one.jpeg" : "assets/images/search_two.png",
                      time: formattedRandomTime1,
                      timetwo: formattedRandomTime2,
                      apptitle: widget.title,
                      stationone: widget.select,
                      stationtwo: AppList.trainschedule[index],
                      number: globle.data.toString().split('/').first,
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
