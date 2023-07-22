import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_trip_details.dart';

import '../../../../controller/globle_controller.dart';
import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';

class TrainScheduleDetailsScreen extends StatefulWidget {
  final String image;
  final String title;
  final String apptitle;
  final String stationone;
  final String stationtwo;
  final String number;
  final String time;
  final String subtitle;
  final String timetwo;

  const TrainScheduleDetailsScreen({super.key, required this.image, required this.title, required this.apptitle, required this.stationone, required this.stationtwo, required this.number, required this.time, required this.timetwo, required this.subtitle});

  @override
  State<TrainScheduleDetailsScreen> createState() => _TrainScheduleDetailsScreenState();
}

class _TrainScheduleDetailsScreenState extends State<TrainScheduleDetailsScreen> {
  GlobleController globle = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.apptitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                height: Get.height * 0.22,
                child: CustomTripDetails(
                  image: widget.image,
                  title: widget.title,
                  date: "",
                  leading: widget.time,
                  trailingtwo: widget.timetwo,
                  subtitle: widget.subtitle,
                  tr: 3,
                  station: widget.stationone,
                  stationone: widget.stationtwo,
                  text: "",
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                height: Get.height * 0.94,
                child: Row(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.only(bottom: index == 0 ? Get.height * 0.14 : Get.height * 0.2, top: 15, right: 15),
                                  child: Column(children: [
                                    Text("Transit", style: TextStyle(color: AppColor.black54)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                color: index == 1
                                                    ? Colors.purple
                                                    : index == 2
                                                        ? Colors.yellow
                                                        : Colors.red,
                                                borderRadius: BorderRadius.circular(10))),
                                        const SizedBox(width: 5),
                                        Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                color: index == 1
                                                    ? AppColor.blue
                                                    : index == 2
                                                        ? Colors.green
                                                        : Colors.orange,
                                                borderRadius: BorderRadius.circular(10)))
                                      ],
                                    )
                                  ]),
                                ))),
                    Expanded(
                      flex: -2,
                      child: Container(
                        width: 8,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey, width: 1)),
                        child: const RotatedBox(
                          quarterTurns: -1,
                          child: LinearProgressIndicator(value: 1, minHeight: 8),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: AppList.trainschedule.length,
                        itemBuilder: (context, index) => Wrap(children: [
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            horizontalTitleGap: 0,
                            title: Text(
                              AppList.trainschedule[index],
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            leading: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                const Icon(Icons.minimize_outlined),
                                widget.stationone == AppList.trainschedule[index] || widget.stationtwo == AppList.trainschedule[index]
                                    ? IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.location_on_rounded,
                                          color: AppColor.blue,
                                        ),
                                      )
                                    : Radio(
                                        value: 1,
                                        activeColor: index == 3 || index == 7 || index == 12 ? AppColor.blue : Colors.grey,
                                        groupValue: 1,
                                        onChanged: (value) {},
                                      ),
                              ],
                            ),
                            trailing: Text(
                                widget.stationone == AppList.trainschedule[index]
                                    ? widget.time
                                    : widget.stationtwo == AppList.trainschedule[index]
                                        ? widget.timetwo
                                        : "",
                                style: TextStyle(color: AppColor.black54)),
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
