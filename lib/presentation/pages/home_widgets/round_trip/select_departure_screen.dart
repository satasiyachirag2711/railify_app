import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/booking_detailscreen.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/sort_filter_screen.dart';
import 'package:railify_app/utils/app_images.dart';

import '../../../../utils/App_list.dart';
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
          return Column(
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
                    RxString formattedDate = DateFormat('yyyy-MM-dd').format(date).obs;
                    global.selectedDate = DateTime.parse(formattedDate.value);
                  },
                ),
              ),
              SizedBox(
                  height: Get.height * 1.3,
                  child: ListView.builder(
                    itemCount: AppList.search.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              BookingDetailScreen(
                                title: AppList.search[index]["data1"],
                                image: AppList.search[index]["image"],
                                subtitle: AppList.search[index]["data5"],
                                trailing: AppList.search[index]["data2"],
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
                                  trailing: Wrap(
                                    children: [
                                      Text(
                                        "Available",
                                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: Get.width * 0.028),
                                      ),
                                      SizedBox(width: Get.width * 0.04),
                                      Text(
                                        "\$${AppList.search[index]["data2"]}",
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
                  ))
            ],
          );
        }),
      ),
    );
  }
}
// Text(
// DateFormat('dd MMMM yyyy').format(global.selectedDate),
// )
