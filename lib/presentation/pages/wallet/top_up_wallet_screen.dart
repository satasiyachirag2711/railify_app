import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/wallet/select_payment_wallet.dart';

import '../../../utils/App_list.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_string.dart';
import '../../widgets/customNavigatebotam.dart';

class TopUpWalletScreen extends StatefulWidget {
  const TopUpWalletScreen({super.key});

  @override
  State<TopUpWalletScreen> createState() => _TopUpWalletScreenState();
}

class _TopUpWalletScreenState extends State<TopUpWalletScreen> {
  GlobleController globle = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppString.topupwallet),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(AppString.entertheamount, style: TextStyle(color: AppColor.black54)),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: Get.height * 0.1,
                decoration: BoxDecoration(border: Border.all(width: 2, color: AppColor.blue)),
                child: Center(
                  child: TextField(
                    controller: globle.topup,
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    decoration: InputDecoration(counterText: "", prefixText: "\$", contentPadding: EdgeInsets.only(left: Get.width * 0.25), focusedBorder: InputBorder.none, border: InputBorder.none),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.08),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: Get.height * 0.25,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 15, mainAxisSpacing: 20, crossAxisCount: 3, mainAxisExtent: 45),
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(border: Border.all(color: AppColor.blue), borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: TextButton(
                          onPressed: () {
                            globle.topup.text = AppList.topup[index].toString();
                          },
                          child: Text("\$${AppList.topup[index].toString()}")),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBotamNavigate(
          onPressed: () {
            Get.off(SelectPaymentWalletScreen(title: globle.topup.text));
          },
          text: AppString.conti),
    );
  }
}
