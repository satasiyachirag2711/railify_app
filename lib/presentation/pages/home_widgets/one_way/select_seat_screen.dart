import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/select_payment.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';

class SelectSeatScreen extends StatefulWidget {
  final String image;
  final String title;
  final String trailing;
  final String date;
  final String leading;
  final String trailingtwo;
  final String subtitle;
  final String name;
  final String email;
  final String phonenumber;
  const SelectSeatScreen({super.key, required this.image, required this.title, required this.trailing, required this.date, required this.leading, required this.trailingtwo, required this.subtitle, required this.name, required this.email, required this.phonenumber});

  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
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
        title: Text(AppString.selectseat),
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
                      : index == 0 || index == 1 || index == 4 || index == 8 || index == 10 || index == 14 || index == 16 || index == 18 || index == 20 || index == 24 || index == 26 || index == 28 || index == 30 || index == 33
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
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (globle.select.contains(AppList.seat)) {
                                    globle.select.add(AppList.seat);
                                  } else {
                                    globle.select.remove(AppList.seat);
                                  }
                                  globle.isSelected[index] = !globle.isSelected[index];
                                  print(AppList.seat[index]);
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: globle.select == true ? AppColor.blue : Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: globle.select == true
                                      ? Icon(Icons.check, color: AppColor.white)
                                      : Text(
                                          AppList.seat[index],
                                          style: TextStyle(color: AppColor.blue, fontWeight: FontWeight.bold),
                                        ),
                                ),
                              ),
                            ),
                ),
              ),
              CustomBtn(
                text: AppString.conti,
                onPressed: () {
                  Get.to(
                    SelectPayment(
                      title: widget.title,
                      trailing: widget.trailing,
                      leading: widget.leading,
                      trailingtwo: widget.trailingtwo,
                      date: widget.date,
                      subtitle: widget.subtitle,
                      image: widget.image,
                      phonenumber: widget.phonenumber,
                      name: widget.name,
                      email: widget.email,
                      seat: globle.select.toString(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
