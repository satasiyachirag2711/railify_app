import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/presentation/pages/home_widgets/re_schedule/schedule_review_summery.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';

import '../../../../controller/globle_controller.dart';
import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';

class SheduleSelectSeat extends StatefulWidget {
  final String name;
  final String email;
  final String phonenumber;
  final String idtype;
  final String idnumber;
  final String passengertype;
  final String timeThree;
  final String timeFour;
  final String dateTwo;
  final String imagetwo;
  final String titletwo;
  final String price;

  const SheduleSelectSeat({
    super.key,
    required this.name,
    required this.email,
    required this.phonenumber,
    required this.idtype,
    required this.idnumber,
    required this.passengertype,
    required this.price,
    required this.imagetwo,
    required this.timeThree,
    required this.timeFour,
    required this.dateTwo,
    required this.titletwo,
  });

  @override
  State<SheduleSelectSeat> createState() => _SheduleSelectSeatState();
}

class _SheduleSelectSeatState extends State<SheduleSelectSeat> {
  GlobleController globle = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(AppString.selectseatfor),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.01, horizontal: Get.width * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(height: 15, width: 15, color: AppColor.blue),
                    Text(AppString.selected),
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
                      : index == 1 || index == 3 || index == 6 || index == 8 || index == 9 || index == 10 || index == 13 || index == 15 || index == 16 || index == 19 || index == 21 || index == 25 || index == 28 || index == 29 || index == 30 || index == 33
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
                          : Obx(() {
                              return GestureDetector(
                                onTap: () {
                                  if (globle.select.contains(AppList.seat[index])) {
                                    globle.select.remove(AppList.seat[index]);
                                  } else {
                                    globle.select.add(AppList.seat[index]);
                                  }
                                  debugPrint(AppList.seat[index]);
                                  debugPrint("${globle.select}");
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: globle.select.contains(AppList.seat[index]) ? AppColor.blue : Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: globle.select.contains(AppList.seat[index])
                                        ? Icon(Icons.check, color: AppColor.white)
                                        : Text(
                                            AppList.seat[index],
                                            style: TextStyle(color: AppColor.blue, fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                ),
                              );
                            }),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomBtn(
            text: AppString.conti,
            onPressed: () {
              Get.to(
                ScheduleReviewSummery(
                  idnumber: widget.idnumber,
                  idtype: widget.idtype,
                  passengertype: widget.passengertype,
                  imagetwo: widget.imagetwo,
                  price: double.parse(widget.price),
                  name: widget.name,
                  dateTwo: widget.dateTwo,
                  timeFour: widget.timeThree,
                  timeThree: widget.timeFour,
                  titletwo: widget.titletwo,
                  email: widget.email,
                  phonenumber: widget.phonenumber,
                  seat: globle.select.toString(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
