import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/re_schedule/shedule_booking_details.dart';
import 'package:railify_app/presentation/widgets/custom_train.dart';
import 'package:railify_app/utils/App_list.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';

class SelectNewSchedule extends StatefulWidget {
  final String image;
  final String title;
  final String date;
  final String leading;
  final String trailingtwo;
  final String subtitle;
  const SelectNewSchedule({super.key, required this.image, required this.title, required this.date, required this.leading, required this.trailingtwo, required this.subtitle});

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
                Icon(Icons.edit)
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
                  trailing: ElevatedButton(onPressed: () {}, child: Text("Paid")),
                ),
                Divider(),
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
                          widget.subtitle,
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
                Divider(height: 20, endIndent: 20, indent: 20),
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
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: Get.height * 1.3,
              child: ListView.builder(
                  itemCount: AppList.search.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(SheduleBookingScreen(
                                  title: widget.title,
                                  timeOne: widget.leading,
                                  timeTwo: widget.trailingtwo,
                                  date: widget.date,
                                  subtitle: widget.subtitle,
                                  image: widget.image,
                                  dateTwo: DateFormat('dd MMMM yyyy').format(global.selectedDate),
                                  price: AppList.search[index]["data2"],
                                  timeThree: AppList.search[index]["data3"],
                                  timeFour: AppList.search[index]["data4"],
                                  imagetwo: AppList.search[index]["image"],
                                  subtitletwo: AppList.search[index]["data5"],
                                  titletwo: AppList.search[index]["data1"]));
                            },
                            child: Container(margin: EdgeInsets.all(5), decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)), height: Get.height * 0.2, child: CustomTrain(index: index)),
                          ),
                        ],
                      )))
        ])));
  }
}
