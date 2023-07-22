import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/ticket/ticket_screen.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_images.dart';

class CancelFoodOrderScreen extends StatefulWidget {
  final List food;

  const CancelFoodOrderScreen({
    super.key,
    required this.food,
  });

  @override
  State<CancelFoodOrderScreen> createState() => _CancelFoodOrderScreenState();
}

class _CancelFoodOrderScreenState extends State<CancelFoodOrderScreen> {
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
                  physics: const NeverScrollableScrollPhysics(),
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
            Container(
              padding: const EdgeInsets.all(20),
              height: Get.height * 0.66,
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppString.reasonforcancel, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04)),
                  const Divider(height: 25),
                  Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: AppList.foodCancel.length,
                      itemBuilder: (context, index) => RadioListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: Text(AppList.foodCancel[index], style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold)),
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
      )),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomBtn(
            text: "${AppString.cancel} Order",
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => Padding(
                        padding: EdgeInsets.only(bottom: Get.height * 0.08),
                        child: AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          title: Container(
                            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(10)),
                            height: Get.height * 0.5,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Image.asset(
                                    AppImages.verify,
                                    width: Get.width,
                                    height: Get.height * 0.3,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(AppString.cancelordersuccess, style: TextStyle(color: AppColor.blue, height: 1.5, fontSize: Get.width * 0.05, fontWeight: FontWeight.bold)),
                                  SizedBox(height: Get.height * 0.03),
                                  Text(AppString.youhavesuccessfully, textAlign: TextAlign.center, style: TextStyle(color: AppColor.black, height: 1.2, fontSize: Get.width * 0.03)),
                                  const SizedBox(height: 20),
                                  CustomBtn(
                                      onPressed: () {
                                        Get.off((TicketScreen()));
                                      },
                                      text: "Ok"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ));
            },
          ),
        ),
      ),
    );
  }
}
