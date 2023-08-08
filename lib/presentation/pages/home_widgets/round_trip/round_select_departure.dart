import 'dart:math';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/sort_filter_screen.dart';
import 'package:railify_app/presentation/pages/home_widgets/round_trip/round_return_train.dart';
import 'package:railify_app/presentation/widgets/custom_train.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';

class SelectDepartureTrain extends StatefulWidget {
  const SelectDepartureTrain({super.key});

  @override
  State<SelectDepartureTrain> createState() => _SelectDepartureTrainState();
}

class _SelectDepartureTrainState extends State<SelectDepartureTrain> {
  GlobleController global = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${AppString.selected} ${AppString.departuretrain}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const SortFilterScreen());
            },
            icon: Icon(
              Icons.filter_list_outlined,
              size: Get.width * 0.08,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColor.white,
              height: Get.height * 0.1,
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColor.blue,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  setState(() {
                    RxString formattedDate = DateFormat('yyyy-MM-dd').format(date).obs;
                    global.selectedDate = DateTime.parse(formattedDate.value);
                  });
                },
              ),
            ),
            SizedBox(
                height: Get.height * 1.3,
                child: ListView.builder(
                  itemCount: global.data.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          double randomValue1 = Random().nextDouble() * 12.0;
                          double randomValue2 = Random().nextDouble() * 12.0;
                          String formattedRandomTime1 = DateFormat('HH:mm').format(DateTime.utc(0, 1, 1).add(Duration(hours: (randomValue1 + 8).toInt(), minutes: ((randomValue1 - (randomValue1 + 8).toInt()) * 60).toInt())));
                          String formattedRandomTime2 = DateFormat('HH:mm').format(DateTime.utc(0, 1, 1).add(Duration(hours: (randomValue2 + 8).toInt(), minutes: ((randomValue2 - (randomValue2 + 8).toInt()) * 60).toInt())));

                          Get.to(
                            RoundReturnTrain(
                              title: global.data[index].contains('- -') ? global.data[index].toString().split('- -').last : global.data[index].toString().split('-').last,
                              image: index % 2 == 0 ? "assets/images/search_one.jpeg" : "assets/images/search_two.png",
                              trailing: "${Random().nextInt(61) + 20}",
                              leading: formattedRandomTime1,
                              date: DateFormat('dd MMMM yyyy').format(global.selectedDate),
                              trailingtwo: formattedRandomTime2,
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                          height: Get.height * 0.2,
                          child: CustomTrain(index: index),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
// Text(
// DateFormat('dd MMMM yyyy').format(global.selectedDate),
// )
