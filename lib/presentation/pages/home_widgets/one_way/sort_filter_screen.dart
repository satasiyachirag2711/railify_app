import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/search_result_screen.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/utils/App_list.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';

class SortFilterScreen extends StatefulWidget {
  const SortFilterScreen({super.key});

  @override
  State<SortFilterScreen> createState() => _SortFilterScreenState();
}

class _SortFilterScreenState extends State<SortFilterScreen> {
  GlobleController global = Get.find();
  bool selectAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          AppString.sortfilter,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
              height: Get.height * 0.42,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.sort,
                    style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
                  ),
                  Divider(height: Get.height * 0.04),
                  Expanded(
                    child: ListView.builder(
                      itemCount: AppList.sortfilter.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => RadioListTile(
                        title: Text(AppList.sortfilter[index].toString()),
                        value: index,
                        groupValue: global.selectedRadioIndex,
                        onChanged: (value) {
                          setState(() {
                            global.selectedRadioIndex = value as int;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
              height: Get.height * 0.25,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.departing,
                    style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
                  ),
                  Divider(height: Get.height * 0.04),
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      ' ${global.rangeValues.start.toStringAsFixed(1)}AM - ${global.rangeValues.end.toStringAsFixed(1)} AM',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  RangeSlider(
                    values: global.rangeValues,
                    min: 0,
                    max: 24,
                    divisions: 24,
                    onChanged: (RangeValues values) {
                      setState(() {
                        global.rangeValues = values;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
              height: Get.height * 0.25,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.ticket,
                    style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
                  ),
                  Divider(height: Get.height * 0.04),
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      '\$${global.ticketrange.start.toString()} - \$${global.ticketrange.end.toString()}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  RangeSlider(
                    values: global.ticketrange,
                    min: 0.0,
                    max: 200.0,
                    divisions: 40,
                    onChanged: (RangeValues values) {
                      setState(() {
                        global.ticketrange = values;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
              height: Get.height * 0.35,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.ticketavili,
                    style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
                  ),
                  Divider(height: Get.height * 0.04),
                  Expanded(
                    child: ListView.builder(
                      itemCount: AppList.sortfilterOne.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => RadioListTile(
                        title: Text(AppList.sortfilterOne[index].toString()),
                        value: index,
                        groupValue: global.ticketavilibility,
                        onChanged: (value) {
                          setState(() {
                            global.ticketavilibility = value as int;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
              height: Get.height * 0.38,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.trainclass,
                    style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
                  ),
                  Divider(height: Get.height * 0.04),
                  Expanded(
                    child: ListView.builder(
                      itemCount: AppList.sortfilterTwo.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => RadioListTile(
                        title: Text(AppList.sortfilterTwo[index].toString()),
                        value: index,
                        groupValue: global.trainclass,
                        onChanged: (value) {
                          setState(() {
                            global.trainclass = value as int;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
              height: Get.height * 0.96,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.Train,
                        style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectAll = !selectAll;
                            for (var item in AppList.sortfilterThree) {
                              item["data2"] = selectAll;
                            }
                          });
                        },
                        child: Text(
                          "Select All",
                          style: TextStyle(fontSize: Get.width * 0.048, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: Get.height * 0.04),
                  Expanded(
                    child: ListView.builder(
                      itemCount: AppList.sortfilterThree.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            value: AppList.sortfilterThree[index]["data2"],
                            onChanged: (value) {
                              AppList.sortfilterThree[index]["data2"] = !AppList.sortfilterThree[index]["data2"];
                              setState(() {});
                            },
                          ),
                          Image.asset(AppList.sortfilterThree[index]["image"],
                              scale: index == 0 || index == 2 || index == 7
                                  ? 32
                                  : index == 6
                                      ? 22
                                      : 13),
                          SizedBox(width: Get.width * 0.02),
                          Text(AppList.sortfilterThree[index]["data1"])
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
              height: Get.height * 0.1,
              width: Get.width,
              child: Row(
                children: [
                  Expanded(
                    child: CustomBtn(
                      onPressed: () {},
                      text: AppString.reset,
                    ),
                  ),
                  SizedBox(width: Get.width * 0.04),
                  Expanded(
                      child: CustomBtn(
                          onPressed: () {
                            Get.off(SearchResultScreen());
                          },
                          text: AppString.apply)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
