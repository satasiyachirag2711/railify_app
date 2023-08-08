import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/review_summary_screen.dart';
import 'package:railify_app/presentation/widgets/customNavigatebotam.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';

class SelectPayment extends StatefulWidget {
  final String image;
  final String title;
  final String trailing;
  final String date;
  final String leading;
  final String trailingtwo;
  final String name;
  final String email;
  final String phonenumber;
  final String seat;
  final String idtype;
  final String idnumber;
  final String passengertype;
  const SelectPayment({super.key, required this.image, required this.title, required this.trailing, required this.date, required this.leading, required this.trailingtwo, required this.name, required this.email, required this.phonenumber, required this.seat, required this.idtype, required this.idnumber, required this.passengertype});

  @override
  State<SelectPayment> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {
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
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.green.shade50),
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
        bottomNavigationBar: CustomBotamNavigate(
          text: AppString.conti,
          onPressed: () {
            Get.to(ReviewSummeryScreen(
                passengertype: widget.passengertype,
                idtype: widget.idtype,
                idnumber: widget.idnumber,
                title: widget.title,
                trailing: double.parse(widget.trailing),
                leading: widget.leading,
                trailingtwo: widget.trailingtwo,
                date: widget.date,
                image: widget.image,
                email: widget.email,
                name: widget.name,
                phonenumber: widget.phonenumber,
                seat: widget.seat,
                paymentimage: AppList.payment[globle.payment]["image"],
                paymentname: AppList.payment[globle.payment]["dataOne"]));
          },
        ));
  }
}
