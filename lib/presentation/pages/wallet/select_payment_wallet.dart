import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/wallet/wallet_screen.dart';
import 'package:railify_app/presentation/widgets/customNavigatebotam.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/utils/app_images.dart';

import '../../../utils/App_list.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_string.dart';

class SelectPaymentWalletScreen extends StatefulWidget {
  final String title;
  const SelectPaymentWalletScreen({super.key, required this.title});

  @override
  State<SelectPaymentWalletScreen> createState() => _SelectPaymentWalletScreenState();
}

class _SelectPaymentWalletScreenState extends State<SelectPaymentWalletScreen> {
  GlobleController globle = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.selectpayment),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.5,
                child: ListView.builder(
                  itemCount: AppList.payment.length,
                  itemBuilder: (context, index) => index == 0
                      ? const SizedBox()
                      : Container(
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
      ),
      bottomNavigationBar: CustomBotamNavigate(
        text: AppString.conti,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    title: Container(
                      decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(10)),
                      height: Get.height * 0.48,
                      child: Column(
                        children: [
                          Image.asset(
                            AppImages.verify,
                            width: Get.width,
                            height: Get.height * 0.3,
                            fit: BoxFit.cover,
                          ),
                          Text(AppString.topupSuccessful, style: TextStyle(color: AppColor.blue, height: 1.7, fontSize: Get.width * 0.05, fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text("A Total of \$${widget.title} has been added to your wallet", textAlign: TextAlign.center, style: TextStyle(color: AppColor.black54, height: 1.2, fontSize: Get.width * 0.03)),
                          ),
                          CustomBtn(
                            onPressed: () {
                              Get.offAll(const WalletScreen());
                            },
                            text: "ok",
                          )
                        ],
                      ),
                    ),
                  ));
        },
      ),
    );
  }
}
