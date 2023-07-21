import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/food/select_trip_to_order_food.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/e_ticket_Screen.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/widget/custom_btn.dart';
import 'package:railify_app/presentation/pages/home_widgets/re_schedule/re_schedule_screen.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../../utils/app_images.dart';
import '../train_cancellation/select_trip_to_cancel.dart';

class TransactionDetailsScreen extends StatefulWidget {
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
  final String idtype;
  final String idnumber;
  final String passengertype;

  final String paymentname;

  const TransactionDetailsScreen({super.key, required this.image, required this.title, required this.trailing, required this.date, required this.leading, required this.trailingtwo, required this.subtitle, required this.name, required this.email, required this.phonenumber, required this.seat, required this.paymentname, required this.idtype, required this.idnumber, required this.passengertype});

  @override
  State<TransactionDetailsScreen> createState() => _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
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
                  AppString.vx79,
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
              AppString.tripdetail,
              style: TextStyle(fontWeight: FontWeight.bold, height: 2, fontSize: Get.width * 0.045),
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
                      AppString.economy,
                      style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
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
              AppString.paymentmethod,
              style: TextStyle(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
              height: Get.height * 0.16,
              width: Get.width,
              margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
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
                  const Divider(),
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
                      Text(AppString.vx79, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(AppString.traidnumber, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(AppString.meridnumber, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(widget.paymentname, style: const TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              AppString.passengerdetails,
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
                                      idnumber: widget.idnumber));
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
