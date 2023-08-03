import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_page.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_dropdownbutton.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../utils/App_list.dart';
import '../../../utils/app_color.dart';

class TrainFareScreen extends StatefulWidget {
  final String title;

  const TrainFareScreen({super.key, required this.title});

  @override
  State<TrainFareScreen> createState() => _TrainFareScreenState();
}

class _TrainFareScreenState extends State<TrainFareScreen> {
  GlobleController globle = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                height: Get.height * 0.34,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDropDown(
                        decoration: InputDecoration(prefixIcon: Icon(Icons.iron_sharp)),
                        hint: AppString.origin,
                        value: globle.fareone,
                        items: AppList.origin.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            globle.fareone = value;
                          });
                        }),
                    CustomDropDown(
                        decoration: InputDecoration(prefixIcon: Icon(Icons.iron_sharp)),
                        hint: AppString.destination,
                        value: globle.faretwo,
                        items: AppList.desti.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            globle.faretwo = value;
                          });
                        }),
                    CustomBtn(
                      text: "Check ${widget.title}",
                      onPressed: () {
                        setState(() {
                          globle.showContainer.value = !globle.showContainer.value; // Toggle the visibility of the second container
                        });
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              globle.showContainer.value
                  ? Container(
                      decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                      height: Get.height * 0.2,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.train_sharp),
                            title: Text(
                              "${globle.fareone} - ${globle.faretwo}",
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              "274 km",
                              style: TextStyle(color: AppColor.black54, height: 2),
                            ),
                          ),
                          Container(
                            height: Get.height * 0.06,
                            decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: TextButton(
                              onPressed: () {
                                Get.off(HomePage());
                              },
                              child: Text(
                                "+ \$40.00",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.035, color: AppColor.black),
                              ),
                            )),
                          )
                        ],
                      ))
                  : const SizedBox()
            ],
          )),
    );
  }
}
