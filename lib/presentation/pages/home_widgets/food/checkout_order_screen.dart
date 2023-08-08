import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_page.dart';
import 'package:railify_app/presentation/pages/home_widgets/food/food_transation_details.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_trip_details.dart';
import 'package:railify_app/presentation/widgets/customNavigatebotam.dart';
import 'package:railify_app/presentation/widgets/custom_textfield.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_btn.dart';

class CheckOutOrderScreen extends StatefulWidget {
  final String image;
  final String title;
  final String date;
  final String timeone;
  final String timetwo;
  final String total;
  final String paymentimage;
  final String paymentname;
  final List food;

  const CheckOutOrderScreen({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.timeone,
    required this.timetwo,
    required this.total,
    required this.paymentimage,
    required this.paymentname,
    required this.food,
  });

  @override
  State<CheckOutOrderScreen> createState() => _CheckOutOrderScreenState();
}

class _CheckOutOrderScreenState extends State<CheckOutOrderScreen> {
  GlobleController global = Get.find();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.checkoutorder,
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
                  AppString.tripdetail,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.045),
                ),
                CustomTripDetails(
                  tr: 0,
                  image: widget.image,
                  title: widget.title,
                  date: widget.date,
                  leading: widget.timeone,
                  trailingtwo: widget.timetwo,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order Summary",
                      style: TextStyle(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Additems +",
                      style: TextStyle(color: AppColor.blue, fontWeight: FontWeight.bold, wordSpacing: 10),
                    ),
                  ],
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
                        trailing: Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: Get.height * 0.028,
                                width: Get.width * 0.058,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.blue, width: 1.5),
                                ),
                                child: Center(
                                  child: Text("*${global.demo[index]}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.028, color: AppColor.blue)),
                                ),
                              ),
                              Icon(Icons.edit, color: AppColor.blue, size: Get.width * 0.05)
                            ],
                          ),
                        ),
                      ),
                    )),
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
                  margin: const EdgeInsets.all(10),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtotal", style: TextStyle(color: AppColor.black54)),
                          Text("\$${widget.total}", style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Service Fee", style: TextStyle(color: AppColor.black54)),
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
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: CustomBotamNavigate(
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
                              Text(AppString.placeordersuccessful, style: TextStyle(color: AppColor.blue, height: 1.5, fontSize: Get.width * 0.05, fontWeight: FontWeight.bold)),
                              SizedBox(height: Get.height * 0.03),
                              Text(AppString.youhavesuccess, textAlign: TextAlign.center, style: TextStyle(color: AppColor.black, height: 1.2, fontSize: Get.width * 0.03)),
                              const SizedBox(height: 20),
                              CustomBtn(
                                  onPressed: () {
                                    Get.to(FoodTransactionDetails(
                                      food: widget.food,
                                      image: widget.image,
                                      title: widget.title,
                                      date: widget.date,
                                      timeone: widget.timeone,
                                      timetwo: widget.timetwo,
                                      total: widget.total,
                                      paymentimage: widget.paymentimage,
                                      paymentname: widget.paymentname,
                                    ));
                                  },
                                  text: AppString.viewtransaction),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Get.offAll(const HomePage());
                                },
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue.shade100), minimumSize: MaterialStatePropertyAll(Size(Get.width, 50)), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                                child: Text(AppString.backtohome),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
        },
        text: AppString.viewtransaction,
      ),
    );
  }
}
