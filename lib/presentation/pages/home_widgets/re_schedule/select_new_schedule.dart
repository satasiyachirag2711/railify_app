import 'dart:math';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/re_schedule/shedule_booking_details.dart';
import 'package:railify_app/presentation/widgets/custom_train.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';

class SelectNewSchedule extends StatefulWidget {
  final String image;
  final String title;
  final String date;
  final String leading;
  final String trailingtwo;
  const SelectNewSchedule({super.key, required this.image, required this.title, required this.date, required this.leading, required this.trailingtwo});

  @override
  State<SelectNewSchedule> createState() => _SelectNewScheduleState();
}

class _SelectNewScheduleState extends State<SelectNewSchedule> {
  GlobleController global = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppString.selectnewschedule),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.selecttrip,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.04),
                ),
                const Icon(Icons.edit)
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
            height: Get.height * 0.32,
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
            child: Column(
              children: [
                ListTile(
                  leading: Image.asset(widget.image, scale: 5),
                  title: Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038),
                  ),
                  subtitle: Text(
                    AppString.economy,
                    style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                  ),
                  trailing: ElevatedButton(onPressed: () {}, child: const Text("Paid")),
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
                          AppString.apex,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                          child: Text(
                            widget.leading,
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                          ),
                        ),
                        Text(
                          widget.date,
                          style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                        )
                      ],
                    ),
                    Column(
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
                          AppString.proxima,
                          style: TextStyle(fontSize: Get.width * 0.034),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                          child: Text(
                            widget.trailingtwo,
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                          ),
                        ),
                        Text(
                          widget.date,
                          style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                        )
                      ],
                    ),
                  ],
                ),
                const Divider(height: 20, endIndent: 20, indent: 20),
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
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: Get.height * 1.3,
              child: ListView.builder(
                  itemCount: global.data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              double randomValue1 = Random().nextDouble() * 12.0;
                              double randomValue2 = Random().nextDouble() * 12.0;
                              String formattedRandomTime1 = DateFormat('HH:mm').format(DateTime.utc(0, 1, 1).add(Duration(hours: (randomValue1 + 8).toInt(), minutes: ((randomValue1 - (randomValue1 + 8).toInt()) * 60).toInt())));
                              String formattedRandomTime2 = DateFormat('HH:mm').format(DateTime.utc(0, 1, 1).add(Duration(hours: (randomValue2 + 8).toInt(), minutes: ((randomValue2 - (randomValue2 + 8).toInt()) * 60).toInt())));

                              Get.to(SheduleBookingScreen(
                                  title: widget.title,
                                  timeOne: widget.leading,
                                  timeTwo: widget.trailingtwo,
                                  date: widget.date,
                                  image: widget.image,
                                  titletwo: global.data[index].contains('- -') ? global.data[index].toString().split('- -').last : global.data[index].toString().split('-').last,
                                  imagetwo: index % 2 == 0 ? "assets/images/search_one.jpeg" : "assets/images/search_two.png",
                                  timeThree: formattedRandomTime1,
                                  dateTwo: DateFormat('dd MMMM yyyy').format(global.selectedDate),
                                  timeFour: formattedRandomTime2,
                                  price: "${Random().nextInt(61) + 20}"));
                            },
                            child: Container(margin: const EdgeInsets.all(5), decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)), height: Get.height * 0.22, child: CustomTrain(index: index)),
                          ),
                        ],
                      )))
        ])));
  }
}
