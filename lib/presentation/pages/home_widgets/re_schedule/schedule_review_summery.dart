import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/transaction_details_screen.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_trip_details.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_btn.dart';
import '../../home_page.dart';

class ScheduleReviewSummery extends StatefulWidget {
  final String name;
  final String email;
  final String phonenumber;
  final String idtype;
  final String idnumber;
  final String passengertype;
  final String timeThree;
  final String timeFour;
  final String dateTwo;
  final String subtitletwo;
  final String imagetwo;
  final String titletwo;
  final double price;
  final String seat;

  const ScheduleReviewSummery({
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
    required this.subtitletwo,
    required this.titletwo,
    required this.seat,
  });

  @override
  State<ScheduleReviewSummery> createState() => _ScheduleReviewSummeryState();
}

class _ScheduleReviewSummeryState extends State<ScheduleReviewSummery> {
  GlobleController global = Get.find();
  int price = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.reviewsummery,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New ${AppString.departuretrain}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.045),
                ),
                CustomTripDetails(image: widget.imagetwo, title: widget.titletwo, date: widget.dateTwo, leading: widget.timeThree, trailingtwo: widget.timeFour, subtitle: widget.subtitletwo, trailing: "\$${widget.price.toString()}"),
                Text(
                  AppString.contackdetail,
                  style: TextStyle(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                  height: Get.height * 0.16,
                  width: Get.width,
                  margin: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppString.fullname, style: TextStyle(color: AppColor.black54)),
                          Text(widget.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppString.email, style: TextStyle(color: AppColor.black54)),
                          Text(widget.email, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppString.phone, style: TextStyle(color: AppColor.black54)),
                          Text(widget.phonenumber, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  "${AppString.passenger}(s)",
                  style: TextStyle(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                  height: Get.height * 0.16,
                  margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.only(left: Get.width * 0.06, right: Get.width * 0.13),
                        leading: Text(
                          "No.",
                          style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold, fontSize: Get.width * 0.034),
                        ),
                        title: Text(
                          "Name",
                          style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold, fontSize: Get.width * 0.034),
                        ),
                        trailing: Wrap(
                          children: [
                            Text(
                              "Carriage",
                              style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold, fontSize: Get.width * 0.034),
                            ),
                            SizedBox(width: Get.width * 0.04),
                            Text(
                              "Seat",
                              style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold, fontSize: Get.width * 0.034),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: Get.width * 0.06),
                        leading: Text(
                          "1.",
                          style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold, fontSize: Get.width * 0.034),
                        ),
                        title: Text(
                          widget.name,
                          style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold, fontSize: Get.width * 0.034),
                        ),
                        trailing: Wrap(
                          children: [
                            Text(
                              "1",
                              style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold, fontSize: Get.width * 0.034),
                            ),
                            SizedBox(width: Get.width * 0.1),
                            Text(
                              "${widget.seat}",
                              style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold, fontSize: Get.width * 0.034),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.06, right: Get.width * 0.05),
                              child: Icon(Icons.edit, color: AppColor.blue, size: Get.width * 0.05),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                  height: global.hide.value == true ? Get.height * 0.18 : Get.height * 0.08,
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          AppString.discount,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04),
                        ),
                        leading: Icon(Icons.discount, color: Colors.orange, size: Get.width * 0.05),
                        trailing: IconButton(
                            onPressed: () {
                              global.hide.value = !global.hide.value;
                            },
                            icon: Icon(global.hide.value ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined, color: AppColor.black, size: Get.width * 0.06)),
                      ),
                      global.hide.value == true ? Divider() : SizedBox(),
                      global.hide.value == true
                          ? Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: Get.height * 0.04,
                                    width: Get.width * 0.3,
                                    decoration: BoxDecoration(border: Border.all(color: AppColor.blue, width: 2), borderRadius: BorderRadius.circular(20)),
                                    child: Center(
                                      child: Text(AppString.vx79, style: TextStyle(color: AppColor.blue, fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(Icons.delete, color: Colors.red)
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      horizontalTitleGap: 1,
                      leading: const Icon(Icons.currency_bitcoin, color: Colors.orange),
                      tileColor: AppColor.white,
                      title: Text(AppString.youhave, style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold)),
                      subtitle: Text(AppString.usecoin, style: TextStyle(fontSize: Get.width * 0.025, fontWeight: FontWeight.bold)),
                      trailing: Switch(
                          onChanged: (value) {
                            global.reivewswitch.value = value;
                          },
                          value: global.reivewswitch.value),
                    ),
                  ),
                ),
                Text(
                  AppString.pricedetails,
                  style: TextStyle(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                  height: Get.height * 0.25,
                  width: Get.width,
                  margin: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Old Ticket Price (Adult*1)", style: TextStyle(color: AppColor.black54)),
                          Text("\$40", style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("New Ticket Price (Adult*1)", style: TextStyle(color: AppColor.black54)),
                          Text("\$${widget.price.toString()}", style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Price Conversion Difference", style: TextStyle(color: AppColor.black54)),
                          Text("\$${40 - widget.price}", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppString.totalprice, style: TextStyle(color: AppColor.black54)),
                          Text("\$${40 - widget.price}", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  AppString.theremaining,
                  style: TextStyle(color: AppColor.black54),
                )
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: CustomBtn(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Padding(
                      padding: EdgeInsets.only(bottom: Get.height * 0.08),
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        title: Container(
                          decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(10)),
                          height: Get.height * 0.65,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.asset(
                                  AppImages.verify,
                                  width: Get.width,
                                  height: Get.height * 0.3,
                                  fit: BoxFit.cover,
                                ),
                                Text(AppString.ticketbooking, style: TextStyle(color: AppColor.blue, height: 1.5, fontSize: Get.width * 0.05, fontWeight: FontWeight.bold)),
                                SizedBox(height: Get.height * 0.03),
                                Text(AppString.youhavesuccess, textAlign: TextAlign.center, style: TextStyle(color: AppColor.black, height: 1.2, fontSize: Get.width * 0.03)),
                                const SizedBox(height: 20),
                                CustomBtn(
                                    onPressed: () {
                                      Get.to(
                                        TransactionDetailsScreen(
                                          title: widget.titletwo,
                                          trailing: widget.price,
                                          leading: widget.timeThree,
                                          trailingtwo: widget.timeFour,
                                          date: widget.dateTwo,
                                          subtitle: widget.subtitletwo,
                                          image: widget.imagetwo,
                                          email: widget.email,
                                          name: widget.name,
                                          phonenumber: widget.phonenumber,
                                          seat: widget.seat,
                                          passengertype: widget.passengertype,
                                          idtype: widget.idtype,
                                          idnumber: widget.idnumber,
                                          paymentname: '',
                                        ),
                                      );
                                    },
                                    text: AppString.viewtransaction),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.offAll(HomePage());
                                  },
                                  child: Text(AppString.backtohome),
                                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue.shade100), minimumSize: MaterialStatePropertyAll(Size(Get.width, 50)), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                text: "Confirm New Schedule")),
      ),
    );
  }
}
