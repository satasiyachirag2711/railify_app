import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/widget/custom_btn.dart';
import 'package:railify_app/presentation/pages/ticket/ticket_canceled_screen.dart';
import 'package:railify_app/utils/App_list.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_btn.dart';

class CancelTripScreen extends StatefulWidget {
  final String title;
  final String image;
  final String trailingtwo;
  final String subtitle;
  final String leading;
  final String date;
  const CancelTripScreen({super.key, required this.title, required this.image, required this.trailingtwo, required this.subtitle, required this.leading, required this.date});

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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    // Get.to(
                    //   SelectNewSchedule(
                    //     title: AppList.search[index]["data1"],
                    //     image: AppList.search[index]["image"],
                    //     subtitle: AppList.search[index]["data5"],
                    //     leading: AppList.search[index]["data3"],
                    //     date: DateFormat('dd MMMM yyyy').format(global.selectedDate),
                    //     trailingtwo: AppList.search[index]["data4"],
                    //   ),
                    // );
                  },
                  child: Container(
                    decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                    height: Get.height * 0.2,
                    child: Column(
                      children: [
                        ListTile(
                            leading: Image.asset(widget.image, scale: 5),
                            title: Text(
                              widget.title,
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038),
                            ),
                            subtitle: Text(
                              AppString.economy,
                              style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                            ),
                            trailing: ElevatedButton(onPressed: () {}, child: const Text("Paid"))),
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
                                    widget.leading,
                                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                                  ),
                                ),
                                Text(
                                  widget.date,
                                  style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(AppImages.searchicon, scale: 12),
                                Text(
                                  widget.subtitle,
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
                                    widget.trailingtwo,
                                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                                  ),
                                ),
                                Text(
                                  widget.date,
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
              ),
              Container(
                padding: const EdgeInsets.all(20),
                height: Get.height * 0.8,
                decoration: BoxDecoration(color: AppColor.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppString.reasonforcancel, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04)),
                    const Divider(height: 25),
                    SizedBox(
                      height: Get.height * 0.7,
                      child: ListView.builder(
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
                                                      Get.offAll(TicketCancelSceen());
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
