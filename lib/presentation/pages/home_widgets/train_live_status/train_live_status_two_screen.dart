import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';

class TrainLiveStatusTwoScreen extends StatefulWidget {
  final String select;
  final String number;
  final String title;
  const TrainLiveStatusTwoScreen({super.key, required this.select, required this.number, required this.title});

  @override
  State<TrainLiveStatusTwoScreen> createState() => _TrainLiveStatusTwoScreenState();
}

class _TrainLiveStatusTwoScreenState extends State<TrainLiveStatusTwoScreen> {
  GlobleController globle = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
        centerTitle: true,
        actions: const [Icon(Icons.more), SizedBox(width: 10)],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 0.5),
            height: Get.height * 0.12,
            width: Get.width,
            color: AppColor.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${widget.select}(${widget.number})",
                  style: TextStyle(fontSize: Get.width * 0.044, color: AppColor.white),
                ),
                Divider(
                  color: AppColor.white,
                  indent: 30,
                  endIndent: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Distance",
                      style: TextStyle(color: AppColor.white),
                    ),
                    Text(
                      "Arrival",
                      style: TextStyle(color: AppColor.white),
                    ),
                    Text(
                      "Departure",
                      style: TextStyle(color: AppColor.white),
                    ),
                    Text(
                      "info",
                      style: TextStyle(color: AppColor.white),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 1.6,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: AppList.trainlivestatus.length,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      AppList.trainlivestatus[index]["dataone"],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: Get.width * 0.035, fontWeight: FontWeight.w500, height: 1.5, color: AppColor.black54),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColor.blue)),
                                      child: Icon(
                                        Icons.notifications_none,
                                        color: AppColor.blue,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RotatedBox(
                  quarterTurns: 6,
                  child: SizedBox(
                    height: Get.height * 1.64,
                    child: SfSlider.vertical(
                      min: 0.0,
                      max: 100.0,
                      value: globle.sliderValue.value,
                      onChanged: (value) {
                        globle.sliderValue = value;
                      },
                      thumbIcon: Icon(Icons.train, color: AppColor.white, size: Get.width * 0.03), interval: 15, // Interval for the dividers
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 1.6,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: AppList.trainlivestatus.length,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppList.trainlivestatus[index]["datatwo"],
                                      style: TextStyle(fontSize: Get.width * 0.035, fontWeight: FontWeight.w500, height: 1.5),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 7),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppList.trainlivestatus[index]["datathree"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: Get.width * 0.035, fontWeight: FontWeight.w500, height: 1.5, color: AppColor.black54),
                                          ),
                                          Text(
                                            index == 2 ? "08:16" : AppList.trainlivestatus[index]["datafour"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: Get.width * 0.035, fontWeight: FontWeight.w500, height: 1.5, color: index == 2 ? Colors.red : AppColor.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          AppList.trainlivestatus[index]["datathree"],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: Get.width * 0.035, fontWeight: FontWeight.w500, height: 1.5, color: AppColor.black54),
                                        ),
                                        Text(
                                          AppList.trainlivestatus[index]["datafour"],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: Get.width * 0.035, fontWeight: FontWeight.w500, height: 1.5, color: AppColor.black54),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: SizedBox(
                  height: Get.height * 1.6,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => SizedBox(height: Get.height * 0.07),
                      shrinkWrap: true,
                      itemCount: AppList.trainlivestatus.length,
                      separatorBuilder: (context, index) => Text(
                            AppList.trainlivestatus[index]["datafive"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: Get.width * 0.035,
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                                color: index == 0 || index == 1 || index == 3 || index == 4
                                    ? Colors.green
                                    : index == 2
                                        ? Colors.red
                                        : AppColor.black54),
                          )),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
