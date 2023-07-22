import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/presentation/pages/home_page.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';

class RefundCalculationTwo extends StatefulWidget {
  final String title;
  final String departuredate;
  final String departuretime;
  final String origin;
  final String destination;
  final String passenger;
  final String train;
  final String ticket;
  const RefundCalculationTwo({super.key, required this.title, required this.departuredate, required this.departuretime, required this.origin, required this.destination, required this.passenger, required this.train, required this.ticket});

  @override
  State<RefundCalculationTwo> createState() => _RefundCalculationTwoState();
}

class _RefundCalculationTwoState extends State<RefundCalculationTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
              height: Get.height * 0.35,
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
                      Text(AppString.departure, style: TextStyle(color: AppColor.black54)),
                      Text(AppString.departing, style: TextStyle(color: AppColor.black54)),
                      Text(AppString.origin, style: TextStyle(color: AppColor.black54)),
                      Text(AppString.destination, style: TextStyle(color: AppColor.black54)),
                      Text(AppString.passenger, style: TextStyle(color: AppColor.black54)),
                      Text(AppString.train, style: TextStyle(color: AppColor.black54)),
                      Text("Ticket Amount", style: TextStyle(color: AppColor.black54)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.departuredate, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(widget.departuretime, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(widget.origin, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(widget.destination, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(widget.passenger, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(widget.train, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text("\$${widget.ticket}", style: const TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
                decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                height: Get.height * 0.2,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      AppString.refundsare,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.042),
                    ),
                    Text(
                      AppString.ofthefundswill,
                      style: TextStyle(color: AppColor.black54),
                    ),
                    Container(
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: TextButton(
                        onPressed: () {
                          Get.off(HomePage());
                        },
                        child: Text(
                          "\$${(double.parse(widget.ticket) * 0.8).toStringAsFixed(2)}",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038),
                        ),
                      )),
                    )
                  ],
                )),
            const SizedBox(height: 20),
            Container(
              height: Get.height * 0.07,
              decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(Icons.info_outline_rounded, color: AppColor.blue),
                  Text(
                    AppString.refundcalculatins,
                    style: TextStyle(
                      color: AppColor.blue,
                      fontSize: Get.width * 0.03,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
