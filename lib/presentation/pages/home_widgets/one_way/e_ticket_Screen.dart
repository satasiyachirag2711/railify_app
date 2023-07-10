import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_images.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../../../utils/app_string.dart';

class ETicketScreen extends StatefulWidget {
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
  const ETicketScreen({super.key, required this.image, required this.title, required this.trailing, required this.date, required this.leading, required this.trailingtwo, required this.subtitle, required this.name, required this.email, required this.phonenumber, required this.seat, required this.idtype, required this.idnumber, required this.passengertype, required this.paymentname});

  @override
  State<ETicketScreen> createState() => _ETicketScreenState();
}

class _ETicketScreenState extends State<ETicketScreen> {
  GlobleController global = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: TicketWidget(
          width: Get.width * 0.9,
          height: Get.height * 0.8,
          isCornerRounded: true,
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.qrcode, scale: 0.9),
              Text(AppString.scanthisqrcode),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            AppString.vx79,
                            style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            AppString.bookingid,
                            style: TextStyle(fontSize: Get.width * 0.03, color: AppColor.black54),
                          ),
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
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppString.passenger, style: TextStyle(color: AppColor.black54)),
                        Text("\$${widget.name}", style: const TextStyle(fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppString.idnumber, style: TextStyle(color: AppColor.black54)),
                        Text(widget.idnumber, style: TextStyle(fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppString.passengertype, style: TextStyle(color: AppColor.black54)),
                        Text(widget.passengertype, style: const TextStyle(fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppString.seat, style: TextStyle(color: AppColor.black54)),
                        Text("Carriage 1/${widget.seat}", style: const TextStyle(fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
