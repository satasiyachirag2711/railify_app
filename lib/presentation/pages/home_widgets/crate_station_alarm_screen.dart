import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_page.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_dropdownbutton.dart';
import 'package:railify_app/presentation/widgets/customNavigatebotam.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../utils/App_list.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_images.dart';

class CreateStationAlarmScreen extends StatefulWidget {
  final String title;
  const CreateStationAlarmScreen({super.key, required this.title});

  @override
  State<CreateStationAlarmScreen> createState() => _CreateStationAlarmScreenState();
}

class _CreateStationAlarmScreenState extends State<CreateStationAlarmScreen> {
  GlobleController globle = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDown(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.iron_sharp)),
                hint: "Select Station",
                value: globle.selectedValuetwo,
                items: AppList.desti.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    globle.selectedValuetwo = value;
                  });
                }),
            SizedBox(height: 15),
            CustomDropDown(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.iron_sharp)),
                hint: AppString.selecttrain,
                value: globle.two,
                items: AppList.selectTrain.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    globle.two = value;
                  });
                }),
            SizedBox(height: 15),
            CustomDropDown(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.iron_sharp)),
                hint: "Alarm",
                value: globle.four,
                items: AppList.alarm.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    globle.four = value;
                  });
                }),
            const SizedBox(height: 25),
            Container(
              height: Get.height * 0.07,
              decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(Icons.info_outline_rounded, color: AppColor.blue),
                  Text(
                    AppString.yourphonepower,
                    style: TextStyle(
                      color: AppColor.blue,
                      fontSize: Get.width * 0.03,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBotamNavigate(
        text: "Create Alarm",
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    title: Container(
                      decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(10)),
                      height: Get.height * 0.52,
                      child: Column(
                        children: [
                          Image.asset(
                            AppImages.verify,
                            width: Get.width,
                            height: Get.height * 0.3,
                            fit: BoxFit.cover,
                          ),
                          Text(AppString.alarmhasbeenset, style: TextStyle(color: AppColor.blue, height: 1.7, fontSize: Get.width * 0.05, fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(AppString.youwillreceive, textAlign: TextAlign.center, style: TextStyle(color: AppColor.black54, height: 1.2, fontSize: Get.width * 0.03)),
                          ),
                          CustomBtn(
                            onPressed: () {
                              Get.offAll(const HomePage());
                            },
                            text: "ok",
                          )
                        ],
                      ),
                    ),
                  ));
        },
      ),
    );
  }
}
