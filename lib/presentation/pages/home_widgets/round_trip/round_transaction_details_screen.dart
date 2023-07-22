import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/e_ticket_Screen.dart';
import 'package:railify_app/presentation/pages/home_widgets/round_trip/round_e_ticket_Screen.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_btn.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_trip_details.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../../utils/app_images.dart';
import '../food/select_trip_to_order_food.dart';
import '../re_schedule/re_schedule_screen.dart';
import '../train_cancellation/select_trip_to_cancel.dart';

class RoundTransactionDetailsScreen extends StatefulWidget {
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

  const RoundTransactionDetailsScreen(
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
      required this.paymentname,
      required this.idtype,
      required this.idnumber,
      required this.passengertype,
      required this.paymentimage,
      required this.returndate,
      required this.time,
      required this.timetwo,
      required this.price,
      required this.imagetwo,
      required this.seattwo,
      required this.returntitle});

  @override
  State<RoundTransactionDetailsScreen> createState() => _RoundTransactionDetailsScreenState();
}

class _RoundTransactionDetailsScreenState extends State<RoundTransactionDetailsScreen> {
  GlobleController global = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.transactiondetails,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.bookingid,
                  style: TextStyle(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
                ),
                Text(
                  AppString.vz25,
                  style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage(AppImages.barcode), scale: 0.6, fit: BoxFit.cover),
              ),
              height: Get.height * 0.16,
              margin: EdgeInsets.symmetric(vertical: Get.height * 0.03),
            ),
            Text(
              AppString.youareobligated,
              style: TextStyle(fontSize: Get.width * 0.032, height: 1.5, fontWeight: FontWeight.bold, color: AppColor.black54),
            ),
            Text(
              "${AppString.tripdetail} (${AppString.departure})",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.045),
            ),
            CustomTripDetails(
              image: widget.image,
              title: widget.title,
              date: widget.date,
              leading: widget.leading,
              trailingtwo: widget.trailing.toString(),
              subtitle: widget.subtitle,
              text: "",
            ),
            Text(
              "${AppString.tripdetail} (Return)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.045),
            ),
            CustomTripDetails(
              image: widget.imagetwo,
              title: widget.returntitle,
              date: widget.returndate,
              leading: widget.time,
              trailingtwo: widget.timetwo,
              subtitle: widget.subtitle,
              text: "",
            ),
            Text(
              AppString.paymentmethod,
              style: TextStyle(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
              height: Get.height * 0.25,
              width: Get.width,
              margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
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
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
              height: Get.height * 0.28,
              width: Get.width,
              margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppString.status, style: TextStyle(color: AppColor.black54)),
                      Text(AppString.bookingid, style: TextStyle(color: AppColor.black54)),
                      Text(AppString.transactionid, style: TextStyle(color: AppColor.black54)),
                      Text(AppString.merchantid, style: TextStyle(color: AppColor.black54)),
                      Text(AppString.paymentmethod, style: TextStyle(color: AppColor.black54)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppString.paid, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(AppString.vz25, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(AppString.traidnumber, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(AppString.meridnumber, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(widget.paymentname, style: const TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "${AppString.passenger}(s) for Departure",
              style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
            ),
            Obx(() {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                height: global.passenger.value == false ? Get.height * 0.4 : Get.height * 0.13,
                width: Get.width,
                margin: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        AppString.passenger1,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.042),
                      ),
                      leading: Icon(Icons.airline_seat_recline_normal_rounded, color: AppColor.black, size: Get.width * 0.07),
                      trailing: IconButton(
                        onPressed: () {
                          global.passenger.value = !global.passenger.value;
                        },
                        icon: Icon(global.passenger.value ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined, color: AppColor.black, size: Get.width * 0.07),
                      ),
                    ),
                    const Divider(),
                    global.passenger.value == false
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: Text(AppString.fullname, style: TextStyle(color: AppColor.black54)),
                                      ),
                                      Text("ID Type", style: TextStyle(color: AppColor.black54)),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: Text(AppString.idnumber, style: TextStyle(color: AppColor.black54)),
                                      ),
                                      Text("Passenger Type", style: TextStyle(color: AppColor.black54)),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: Text("Seat", style: TextStyle(color: AppColor.black54)),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: Text(widget.name, style: const TextStyle(fontWeight: FontWeight.w500)),
                                      ),
                                      Text(widget.idtype, style: const TextStyle(fontWeight: FontWeight.w500)),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: Text(widget.idnumber, style: const TextStyle(fontWeight: FontWeight.w500)),
                                      ),
                                      Text(widget.passengertype, style: const TextStyle(fontWeight: FontWeight.w500)),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: Text(widget.seat, style: const TextStyle(fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              CustomBtn(
                                text: AppString.showeticket,
                                onPressed: () {
                                  Get.to(ETicketScreen(
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
                                    idnumber: widget.idnumber,
                                  ));
                                },
                              )
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              );
            }),
            Text(
              "${AppString.passenger}(s) for Return",
              style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
            ),
            Obx(() {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                height: global.passenger.value == false ? Get.height * 0.4 : Get.height * 0.13,
                width: Get.width,
                margin: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        AppString.passenger1,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.042),
                      ),
                      leading: Icon(Icons.airline_seat_recline_normal_rounded, color: AppColor.black, size: Get.width * 0.07),
                      trailing: IconButton(
                        onPressed: () {
                          global.passenger.value = !global.passenger.value;
                        },
                        icon: Icon(global.passenger.value ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined, color: AppColor.black, size: Get.width * 0.07),
                      ),
                    ),
                    const Divider(),
                    global.passenger.value == false
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: Text(AppString.fullname, style: TextStyle(color: AppColor.black54)),
                                      ),
                                      Text("ID Type", style: TextStyle(color: AppColor.black54)),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: Text(AppString.idnumber, style: TextStyle(color: AppColor.black54)),
                                      ),
                                      Text("Passenger Type", style: TextStyle(color: AppColor.black54)),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: Text("Seat", style: TextStyle(color: AppColor.black54)),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: Text(widget.name, style: const TextStyle(fontWeight: FontWeight.w500)),
                                      ),
                                      Text(widget.idtype, style: const TextStyle(fontWeight: FontWeight.w500)),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: Text(widget.idnumber, style: const TextStyle(fontWeight: FontWeight.w500)),
                                      ),
                                      Text(widget.passengertype, style: const TextStyle(fontWeight: FontWeight.w500)),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: Text(widget.seattwo, style: const TextStyle(fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              CustomBtn(
                                text: AppString.showeticket,
                                onPressed: () {
                                  Get.to(RoundETicketScreen(
                                    title: widget.returntitle,
                                    trailing: widget.price,
                                    leading: widget.time,
                                    trailingtwo: widget.timetwo,
                                    date: widget.returndate,
                                    subtitle: widget.subtitle,
                                    image: widget.imagetwo,
                                    name: widget.name,
                                    seat: widget.seattwo,
                                    passengertype: widget.passengertype,
                                    idtype: widget.idtype,
                                    idnumber: widget.idnumber,
                                  ));
                                },
                              )
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              );
            }),
            CustomBtnone(
              text: AppString.order,
              onPressed: () {
                Get.off(const SelectTripOrderFood());
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomBtnone(
                text: AppString.reschedule,
                onPressed: () {
                  Get.off(const ReScheduleScreen());
                },
              ),
            ),
            CustomBtnone(
              text: AppString.cancelticket,
              onPressed: () {
                Get.off(const SelectTripScreen());
              },
            )
          ],
        ),
      )),
    );
  }
}
