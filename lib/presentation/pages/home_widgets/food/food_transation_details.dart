import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/food/cancel_food_order_scren.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_btn.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_trip_details.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../../utils/app_images.dart';

class FoodTransactionDetails extends StatefulWidget {
  final String image;
  final String title;
  final String date;
  final String timeone;
  final String timetwo;
  final String subtitle;
  final String total;
  final String paymentimage;
  final String paymentname;
  final List food;

  const FoodTransactionDetails({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.timeone,
    required this.timetwo,
    required this.subtitle,
    required this.total,
    required this.paymentimage,
    required this.paymentname,
    required this.food,
  });

  @override
  State<FoodTransactionDetails> createState() => _FoodTransactionDetailsState();
}

class _FoodTransactionDetailsState extends State<FoodTransactionDetails> {
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
                  AppString.wz47,
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
            CustomTripDetails(
              tr: 0,
              image: widget.image,
              title: widget.title,
              date: widget.date,
              leading: widget.timeone,
              trailingtwo: widget.timetwo,
              subtitle: widget.subtitle,
            ),
            Text(
              "Order Summary",
              style: TextStyle(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
            ),
            Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                width: Get.width,
                margin: EdgeInsets.all(Get.height * 0.01),
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Divider(height: 10),
                  itemCount: widget.food.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text("${widget.food[index]["dataOne"]}", style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038)),
                    leading: Container(
                      width: Get.width * 0.18,
                      height: Get.height * 0.12,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), image: DecorationImage(image: AssetImage(widget.food[index]["image"]), fit: BoxFit.cover)),
                    ),
                    subtitle: Text("\$${widget.food[index]["dataTwo"]}", style: TextStyle(height: 2, fontSize: Get.width * 0.032, color: AppColor.blue)),
                    trailing: Container(
                      margin: EdgeInsets.only(left: Get.width * 0.1),
                      height: Get.height * 0.028,
                      width: Get.width * 0.058,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.blue, width: 1.5),
                      ),
                      child: Center(
                        child: Text("*${global.demo[index]}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.028, color: AppColor.blue)),
                      ),
                    ),
                  ),
                )),
            Text(
              "Payment Details",
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
                      Text(AppString.subtotal, style: TextStyle(color: AppColor.black54)),
                      Text("\$${widget.total}", style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppString.servicefee, style: TextStyle(color: AppColor.black54)),
                      const Text("Free", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppString.totalprice, style: TextStyle(color: AppColor.black54)),
                      Text("\$${widget.total}", style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
              height: Get.height * 0.22,
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
                      Text(AppString.orderid, style: TextStyle(color: AppColor.black54)),
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
                      Text(AppString.wz47, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(AppString.traidnumber, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(AppString.meridnumber, style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(widget.paymentname, style: const TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
            CustomBtnone(
              text: "${AppString.cancel} Order",
              onPressed: () {
                Get.off(CancelFoodOrderScreen(
                  food: widget.food,
                ));
              },
            )
          ],
        ),
      )),
    );
  }
}
