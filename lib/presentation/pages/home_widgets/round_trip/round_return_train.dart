import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/round_trip/round_booking_screen.dart';
import 'package:railify_app/utils/App_list.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_train.dart';

class RoundReturnTrain extends StatefulWidget {
  final String image;
  final String title;
  final String trailing;
  final String date;
  final String leading;
  final String trailingtwo;
  final String subtitle;
  const RoundReturnTrain({super.key, required this.image, required this.title, required this.trailing, required this.date, required this.leading, required this.trailingtwo, required this.subtitle});

  @override
  State<RoundReturnTrain> createState() => _RoundReturnTrainState();
}

class _RoundReturnTrainState extends State<RoundReturnTrain> {
  GlobleController global = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Return Train"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${AppString.selected} ${AppString.departuretrain}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04),
                ),
                const Icon(Icons.edit)
              ],
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
                    trailing: Wrap(
                      children: [
                        Text(
                          "Available",
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: Get.width * 0.028),
                        ),
                        SizedBox(width: Get.width * 0.04),
                        Text(
                          "\$${widget.trailing}",
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: Get.height * 1.3,
                child: ListView.builder(
                  itemCount: AppList.search.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            RoundBookingScreen(
                              returntitle: AppList.search[index]["data1"],
                              title: widget.title,
                              trailing: widget.trailing,
                              leading: widget.leading,
                              trailingtwo: widget.trailingtwo,
                              date: widget.date,
                              subtitle: widget.subtitle,
                              image: widget.image,
                              returndate: DateFormat('dd MMMM yyyy').format(global.selectedDate),
                              price: AppList.search[index]["data2"],
                              time: index == 0 ? AppList.search[2]["data3"] : AppList.search[index]["data3"],
                              timetwo: index == 0 ? AppList.search[2]["data4"] : AppList.search[index]["data4"],
                              imagetwo: AppList.search[index]["image"],
                            ),
                          );
                        },
                        child: Container(margin: const EdgeInsets.all(20), decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)), height: Get.height * 0.2, child: CustomTrain(index: index)),
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
