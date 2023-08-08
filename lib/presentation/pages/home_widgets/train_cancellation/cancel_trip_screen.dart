import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_btn.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_trip_details.dart';
import 'package:railify_app/presentation/pages/ticket/ticket_screen.dart';
import 'package:railify_app/utils/App_list.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_btn.dart';

class CancelTripScreen extends StatefulWidget {
  final String title;
  final String image;
  final String trailingtwo;
  final String leading;
  final String date;
  const CancelTripScreen({super.key, required this.title, required this.image, required this.trailingtwo, required this.leading, required this.date});

  @override
  State<CancelTripScreen> createState() => _CancelTripScreenState();
}

class _CancelTripScreenState extends State<CancelTripScreen> {
  GlobleController global = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${AppString.cancel} Trip"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Trip Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04)),
              Container(
                decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                height: Get.height * 0.22,
                child: CustomTripDetails(
                  tr: 0,
                  image: widget.image,
                  title: widget.title,
                  date: widget.date,
                  leading: widget.leading,
                  trailingtwo: widget.trailingtwo,
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(20),
                height: Get.height * 0.7,
                decoration: BoxDecoration(color: AppColor.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppString.reasonforcancel, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04)),
                    const Divider(height: 25),
                    SizedBox(
                      height: Get.height * 0.6,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: AppList.canceltrip.length,
                        itemBuilder: (context, index) => RadioListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: Text(AppList.canceltrip[index], style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold)),
                          onChanged: (value) {
                            setState(() {
                              global.payment = value!;
                            });
                          },
                          groupValue: global.payment,
                          value: index,
                        ),
                      ),
                    ),
                  ],
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
              text: "Cancel Trip",
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  context: context,
                  builder: (context) => Container(
                    height: Get.height * 0.35,
                    decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.vertical(top: Radius.circular(Get.width * 0.1))),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            AppString.confirmcancel,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.042),
                          ),
                          const Divider(),
                          Text(
                            AppString.areyousureyouwant,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04),
                          ),
                          Text(
                            AppString.only80of,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: Get.width * 0.035),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomBtnone(
                                  text: AppString.nodont,
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: CustomBtn(
                                  text: AppString.yescancel,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Padding(
                                        padding: EdgeInsets.only(bottom: Get.height * 0.04),
                                        child: AlertDialog(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          title: Container(
                                            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(10)),
                                            height: Get.height * 0.52,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    AppImages.verify,
                                                    width: Get.width,
                                                    height: Get.height * 0.3,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Text("Cancel Trip Successful!", style: TextStyle(color: AppColor.blue, height: 1.5, fontSize: Get.width * 0.05, fontWeight: FontWeight.bold)),
                                                  SizedBox(height: Get.height * 0.03),
                                                  Text(AppString.youhavesuccess, textAlign: TextAlign.center, style: TextStyle(color: AppColor.black, height: 1.2, fontSize: Get.width * 0.03)),
                                                  const SizedBox(height: 20),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Get.off(TicketScreen());
                                                    },
                                                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue.shade100), minimumSize: MaterialStatePropertyAll(Size(Get.width, 50)), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                                                    child: const Text("Ok"),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
