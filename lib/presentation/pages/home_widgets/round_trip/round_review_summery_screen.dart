import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/round_trip/round_confirm_pin_screen.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_trip_details.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';

class RoundReviewSummery extends StatefulWidget {
  final String paymentimage;
  final String paymentname;
  final String image;
  final String title;
  final double trailing;
  final String date;
  final String leading;
  final String trailingtwo;
  final String subtitle;
  final String name;
  final String email;
  final String phonenumber;
  final String idtype;
  final String idnumber;
  final String passengertype;
  final String returndate;
  final String time;
  final String timetwo;
  final double price;
  final String imagetwo;
  final String seat;
  final String seattwo;
  final String returntitle;

  const RoundReviewSummery(
      {super.key,
      required this.image,
      required this.title,
      required this.trailing,
      required this.date,
      required this.leading,
      required this.trailingtwo,
      required this.subtitle,
      required this.name,
      required this.email,
      required this.phonenumber,
      required this.seat,
      required this.paymentimage,
      required this.paymentname,
      required this.idtype,
      required this.idnumber,
      required this.passengertype,
      required this.returndate,
      required this.time,
      required this.timetwo,
      required this.price,
      required this.imagetwo,
      required this.seattwo,
      required this.returntitle});

  @override
  State<RoundReviewSummery> createState() => _RoundReviewSummeryState();
}

class _RoundReviewSummeryState extends State<RoundReviewSummery> {
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
                  "${AppString.tripdetail} (${AppString.departure})",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.045),
                ),
                CustomTripDetails(
                  trailing: "\$${widget.trailing}",
                  image: widget.image,
                  title: widget.title,
                  date: widget.date,
                  leading: widget.leading,
                  trailingtwo: widget.trailingtwo,
                  subtitle: widget.subtitle,
                ),
                Text(
                  "${AppString.tripdetail} (Return)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.045),
                ),
                CustomTripDetails(
                  trailing: "\$${widget.price}",
                  image: widget.imagetwo,
                  title: widget.returntitle,
                  date: widget.returndate,
                  leading: widget.time,
                  trailingtwo: widget.timetwo,
                  subtitle: widget.subtitle,
                ),
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
                  "${AppString.passenger}(s) for Departure",
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
                              widget.seat,
                              style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold, fontSize: Get.width * 0.034),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
                              child: Icon(Icons.edit, color: AppColor.blue, size: Get.width * 0.05),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${AppString.passenger}(s) for Return",
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
                              widget.seattwo,
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
                Text(
                  AppString.paymentmethod,
                  style: TextStyle(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(15),
                      leading: Image.asset(widget.paymentimage, scale: 14),
                      tileColor: AppColor.white,
                      title: Text(widget.paymentname, style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold)),
                      trailing: Text(
                        AppString.change,
                        style: TextStyle(color: AppColor.blue, fontSize: Get.width * 0.035, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                  height: global.hide.value == true ? Get.height * 0.18 : Get.height * 0.1,
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
                      const Divider(),
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
                                  const SizedBox(width: 10),
                                  const Icon(Icons.delete, color: Colors.red)
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
                          Text(AppString.pricedeparture, style: TextStyle(color: AppColor.black54)),
                          Text("\$${widget.trailing.toString()}", style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppString.pricereturn, style: TextStyle(color: AppColor.black54)),
                          Text("\$${widget.price.toString()}", style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppString.tax, style: TextStyle(color: AppColor.black54)),
                          const Text("\$4.00", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppString.discount25, style: TextStyle(color: AppColor.black54)),
                          const Text("- \$22.75", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppString.totalprice, style: TextStyle(color: AppColor.black54)),
                          Text("\$${widget.trailing + widget.price + 4 - 22.75}", style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
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
                  Get.to(RoundConfirmPinScreen(
                      returntitle: widget.returntitle,
                      passengertype: widget.passengertype,
                      price: widget.price,
                      imagetwo: widget.imagetwo,
                      returndate: widget.returndate,
                      time: widget.time,
                      timetwo: widget.timetwo,
                      idtype: widget.idtype,
                      idnumber: widget.idnumber,
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
                      seat: widget.seat,
                      seattwo: widget.seattwo,
                      paymentimage: widget.paymentimage,
                      paymentname: widget.paymentname));
                },
                text: AppString.confirmbooking)),
      ),
    );
  }
}
