import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/food/checkout_order_screen.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_btn.dart';

class FoodSelectPaymentMethod extends StatefulWidget {
  final String image;
  final String title;
  final String date;
  final String timeone;
  final String timetwo;
  final String total;
  final List food;

  const FoodSelectPaymentMethod({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.timeone,
    required this.timetwo,
    required this.total,
    required this.food,
  });

  @override
  State<FoodSelectPaymentMethod> createState() => _FoodSelectPaymentMethodState();
}

class _FoodSelectPaymentMethodState extends State<FoodSelectPaymentMethod> {
  GlobleController globle = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.selectpayment,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.62,
                  child: ListView.builder(
                    itemCount: AppList.payment.length,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(15),
                          leading: Image.asset(AppList.payment[index]["image"], scale: 14),
                          tileColor: AppColor.white,
                          title: Text(AppList.payment[index]["dataOne"], style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold)),
                          trailing: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              index == 0
                                  ? Text(
                                      "\$946.50",
                                      style: TextStyle(color: AppColor.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.035),
                                    )
                                  : const SizedBox(),
                              Radio(
                                value: index,
                                groupValue: globle.payment,
                                onChanged: (value) {
                                  setState(() {
                                    globle.payment = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.blue.shade50),
                  child: Center(
                    child: Text(
                      "+ ${AppString.addmore}",
                      style: TextStyle(wordSpacing: 10, color: AppColor.blue, fontSize: Get.width * 0.035, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomBtn(
            text: AppString.conti,
            onPressed: () {
              Get.to(CheckOutOrderScreen(
                food: widget.food,
                image: widget.image,
                title: widget.title,
                date: widget.date,
                timeone: widget.timeone,
                timetwo: widget.timetwo,
                total: widget.total,
                paymentimage: AppList.payment[globle.payment]["image"],
                paymentname: AppList.payment[globle.payment]["dataOne"],
              ));
            },
          ),
        ),
      ),
    );
  }
}
