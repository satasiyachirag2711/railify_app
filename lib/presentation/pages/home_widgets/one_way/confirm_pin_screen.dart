import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:railify_app/presentation/pages/home_page.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/transaction_details_screen.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';

class ConfirmPinScreen extends StatefulWidget {
  final String image;
  final String title;
  final double trailing;
  final String date;
  final String leading;
  final String trailingtwo;
  final String name;
  final String email;
  final String phonenumber;
  final String seat;
  final String paymentname;
  final String idtype;
  final String idnumber;
  final String passengertype;
  const ConfirmPinScreen({super.key, required this.image, required this.title, required this.trailing, required this.date, required this.leading, required this.trailingtwo, required this.name, required this.email, required this.phonenumber, required this.seat, required this.paymentname, required this.idtype, required this.idnumber, required this.passengertype});

  @override
  State<ConfirmPinScreen> createState() => _ConfirmPinScreenState();
}

class _ConfirmPinScreenState extends State<ConfirmPinScreen> {
  TextEditingController pinput = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.confirmpin, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.2),
              Text(
                AppString.enteryourpin,
                style: TextStyle(height: 2, fontSize: Get.width * 0.035, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.06),
                child: Pinput(
                  obscureText: true,
                  forceErrorState: true,
                  focusedPinTheme: PinTheme(
                    height: Get.height * 0.09,
                    width: Get.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColor.blue),
                    ),
                  ),
                  obscuringWidget: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(color: AppColor.black, borderRadius: BorderRadius.circular(30)),
                  ),
                  controller: pinput,
                  validator: (s) {
                    debugPrint(pinput.text);
                    return null;
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                ),
              ),
              CustomBtn(
                text: AppString.confirm,
                onPressed: () {
                  debugPrint("${pinput.length}");
                  if (pinput.length > 3) {
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
                                  Text(AppString.ticketbooking, style: TextStyle(color: AppColor.blue, height: 1.5, fontSize: Get.width * 0.05, fontWeight: FontWeight.bold)),
                                  SizedBox(height: Get.height * 0.03),
                                  Text(AppString.youhavesuccess, textAlign: TextAlign.center, style: TextStyle(color: AppColor.black, height: 1.2, fontSize: Get.width * 0.03)),
                                  const SizedBox(height: 20),
                                  CustomBtn(
                                      onPressed: () {
                                        Get.to(
                                          TransactionDetailsScreen(
                                            title: widget.title,
                                            trailing: widget.trailing,
                                            leading: widget.leading,
                                            trailingtwo: widget.trailingtwo,
                                            date: widget.date,
                                            image: widget.image,
                                            email: widget.email,
                                            name: widget.name,
                                            phonenumber: widget.phonenumber,
                                            seat: widget.seat,
                                            paymentname: widget.paymentname,
                                            passengertype: widget.passengertype,
                                            idtype: widget.idtype,
                                            idnumber: widget.idnumber,
                                          ),
                                        );
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
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
