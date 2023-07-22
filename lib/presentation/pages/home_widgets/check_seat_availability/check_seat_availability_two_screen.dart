import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/check_seat_availability/seat_availability_screen.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/sort_filter_screen.dart';
import 'package:railify_app/presentation/widgets/custom_train.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';

class CheckSeatAvailabilityTwo extends StatefulWidget {
  final String title;
  const CheckSeatAvailabilityTwo({super.key, required this.title});

  @override
  State<CheckSeatAvailabilityTwo> createState() => _CheckSeatAvailabilityTwoState();
}

class _CheckSeatAvailabilityTwoState extends State<CheckSeatAvailabilityTwo> {
  GlobleController global = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppString.searchresult,
            style: const TextStyle(fontWeight: FontWeight.bold),
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
          child: Obx(() {
            return Column(children: [
              Container(
                  color: AppColor.white,
                  height: Get.height * 0.1,
                  child: DatePicker(DateTime.now(), initialSelectedDate: DateTime.now(), selectionColor: AppColor.blue, selectedTextColor: Colors.white, onDateChange: (date) {
                    setState(() {
                      RxString formattedDate = DateFormat('yyyy-MM-dd').format(date).obs;
                      global.selectedDate = DateTime.parse(formattedDate.value);
                    });
                  })),
              SizedBox(
                  height: Get.height * 1.3,
                  child: ListView.builder(
                      itemCount: AppList.search.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Column(children: [
                            GestureDetector(
                                onTap: () {
                                  Get.off(
                                    SeatAvailability(
                                      title: AppList.search[index]["data1"],
                                      image: AppList.search[index]["image"],
                                      subtitle: AppList.search[index]["data5"],
                                      price: AppList.search[index]["data2"],
                                      time: AppList.search[index]["data3"],
                                      date: DateFormat('dd MMMM yyyy').format(global.selectedDate),
                                      timetwo: AppList.search[index]["data4"],
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                                  height: Get.height * 0.2,
                                  child: CustomTrain(index: index, tr: 1),
                                ))
                          ])))
            ]);
          }),
        ));
  }
}
// Text(
// DateFormat('dd MMMM yyyy').format(global.selectedDate),
// )
