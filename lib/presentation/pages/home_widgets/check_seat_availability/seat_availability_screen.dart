import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_trip_details.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';

class SeatAvailability extends StatefulWidget {
  final String title;
  final String image;
  final String subtitle;
  final String price;
  final String time;
  final String timetwo;
  final String date;

  const SeatAvailability({super.key, required this.title, required this.image, required this.time, required this.timetwo, required this.date, required this.subtitle, required this.price});

  @override
  State<SeatAvailability> createState() => _SeatAvailabilityState();
}

class _SeatAvailabilityState extends State<SeatAvailability> {
  GlobleController globle = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.seatavailability),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTripDetails(
                tr: 1,
                trailing: widget.price,
                image: widget.image,
                title: widget.title,
                date: widget.date,
                leading: widget.time,
                trailingtwo: widget.timetwo,
                subtitle: widget.subtitle,
              ),
              SizedBox(height: Get.height * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.01, horizontal: Get.width * 0.15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(height: 15, width: 15, color: Colors.blueGrey.shade300),
                    Text(AppString.occupied),
                    Container(height: 15, width: 15, color: Colors.blue.shade50),
                    Text(AppString.available),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "A B",
                    style: TextStyle(fontSize: Get.width * 0.052, fontWeight: FontWeight.bold, wordSpacing: Get.width * 0.13),
                  ),
                  SizedBox(width: Get.width * 0.33),
                  Text(
                    "C D",
                    style: TextStyle(fontSize: Get.width * 0.052, fontWeight: FontWeight.bold, wordSpacing: Get.width * 0.12),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.02),
              SizedBox(
                height: Get.height * 0.63,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: AppList.seat.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                  itemBuilder: (context, index) => index == 2 || index == 7 || index == 12 || index == 17 || index == 22 || index == 27 || index == 32
                      ? Center(child: Text(AppList.seat[index]))
                      : index == 0 || index == 1 || index == 3 || index == 6 || index == 8 || index == 9 || index == 10 || index == 13 || index == 14 || index == 15 || index == 18 || index == 20 || index == 21 || index == 24 || index == 26 || index == 28 || index == 29 || index == 30 || index == 31 || index == 34
                          ? Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.shade300,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  AppList.seat[index],
                                  style: TextStyle(color: AppColor.white),
                                ),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  AppList.seat[index],
                                  style: TextStyle(color: AppColor.blue, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
