import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/confirm_pin_screen.dart';
import 'package:railify_app/presentation/widgets/custom_textfield.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_btn.dart';

class ReviewSummeryScreen extends StatefulWidget {
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
  final String seat;
  final String paymentimage;
  final String paymentname;
  final String idtype;
  final String idnumber;
  final String passengertype;

  const ReviewSummeryScreen(
      {super.key, required this.image, required this.title, required this.trailing, required this.date, required this.leading, required this.trailingtwo, required this.subtitle, required this.name, required this.email, required this.phonenumber, required this.seat, required this.paymentimage, required this.paymentname, required this.idtype, required this.idnumber, required this.passengertype});

  @override
  State<ReviewSummeryScreen> createState() => _ReviewSummeryScreenState();
}

class _ReviewSummeryScreenState extends State<ReviewSummeryScreen> {
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
                  AppString.departuretrain,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.045),
                ),
                Container(
                  decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                  height: Get.height * 0.22,
                  margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset(widget.image, scale: 5),
                        title: Text(
                          widget.title,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038),
                        ),
                        subtitle: Text(
                          "Economy",
                          style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                        ),
                        trailing: Wrap(
                          children: [
                            Text(
                              "Available",
                              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: Get.width * 0.028),
                            ),
                            SizedBox(width: Get.width * 0.04),
                            Text(
                              "\$${widget.trailing}",
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                            )
                          ],
                        ),
                      ),
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
                  height: Get.height * 0.18,
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
                              "${widget.seat[1]}",
                              style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold, fontSize: Get.width * 0.034),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.08, right: Get.width * 0.05),
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
                  decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                  height: Get.height * 0.15,
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
                              "${widget.seat[1]}${widget.seat[2]}",
                              style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold, fontSize: Get.width * 0.034),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.08, right: Get.width * 0.05),
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
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomTextFild(
                                        hint: AppString.entercode,
                                        leble: AppString.entercode,
                                        controller: global.redeem,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(AppString.redeemcode),
                                  ),
                                ),
                              ],
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
                          Text(AppString.priceadult, style: TextStyle(color: AppColor.black54)),
                          Text("\$${widget.trailing.toString()}", style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppString.tax, style: TextStyle(color: AppColor.black54)),
                          const Text("\$2.00", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppString.totalprice, style: TextStyle(color: AppColor.black54)),
                          Text("\$${widget.trailing + 2}", style: const TextStyle(fontWeight: FontWeight.bold)),
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
                  Get.to(ConfirmPinScreen(
                      title: widget.title,
                      trailing: widget.trailing,
                      leading: widget.leading,
                      trailingtwo: widget.trailingtwo,
                      date: widget.date,
                      subtitle: widget.subtitle,
                      image: widget.image,
                      email: widget.email,
                      name: widget.name,
                      phonenumber: widget.phonenumber,
                      seat: widget.seat,
                      paymentname: widget.paymentname,
                      passengertype: widget.passengertype,
                      idtype: widget.idtype,
                      idnumber: widget.idnumber));
                },
                text: AppString.confirmbooking)),
      ),
    );
  }
}
