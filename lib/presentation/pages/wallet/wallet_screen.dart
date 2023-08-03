import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:railify_app/presentation/pages/wallet/resent_transaction_screen.dart';
import 'package:railify_app/presentation/pages/wallet/top_up_wallet_screen.dart';

import '../../../controller/globle_controller.dart';
import '../../../utils/App_list.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_string.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  GlobleController globle = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.mywallet,
        ),
        centerTitle: true,
        leading: const Icon(Icons.train),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                height: Get.height * 0.27,
                decoration: BoxDecoration(color: AppColor.blue, borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.andrew,
                          style: TextStyle(color: AppColor.white, fontWeight: FontWeight.w500, fontSize: Get.width * 0.04),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ".... .... ....",
                              style: TextStyle(color: AppColor.white, fontWeight: FontWeight.w500, fontSize: Get.width * 0.085),
                            ),
                            const SizedBox(width: 10),
                            Icon(
                              Icons.visibility_off,
                              color: AppColor.white,
                              size: Get.width * 0.05,
                            )
                          ],
                        ),
                        Text(
                          AppString.yourbalance,
                          style: TextStyle(color: AppColor.white, height: 4, fontSize: Get.width * 0.036),
                        ),
                        Text(
                          AppString.price,
                          style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold, fontSize: Get.width * 0.065, height: 1.4),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              AppString.visa,
                              style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold, fontSize: Get.width * 0.07),
                            ),
                            Icon(Icons.circle_rounded, color: Colors.red.shade300),
                            Icon(Icons.circle_rounded, color: Colors.yellow.shade300)
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(const TopUpWalletScreen());
                          },
                          child: Container(
                            height: Get.height * 0.05,
                            width: Get.width * 0.25,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColor.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.keyboard_double_arrow_down, size: Get.width * 0.05),
                                Text(
                                  AppString.topup,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.035),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: ListTile(
                    horizontalTitleGap: 1,
                    leading: const Icon(Icons.currency_bitcoin, color: Colors.orange),
                    tileColor: AppColor.white,
                    title: Text(AppString.coins25, style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold)),
                    subtitle: Text(AppString.youcanusethese, style: TextStyle(fontSize: Get.width * 0.025, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const ResentTransationScreen());
                },
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(
                    AppString.recenttransation,
                    style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.arrow_forward, color: AppColor.blue),
                ]),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: Get.height * 0.5,
                child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(height: 3),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppList.recenttransaction.length,
                    itemBuilder: (context, index) => ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: index == 0 ? Image.asset(AppImages.cutlery, scale: 20, color: AppColor.blue) : Icon(index == 4 || index == 7 || index == 13 ? Icons.keyboard_double_arrow_down : Icons.train, color: AppColor.blue),
                          title: Text(AppList.recenttransaction[index]["data"], style: TextStyle(fontWeight: FontWeight.w600, fontSize: Get.width * 0.038)),
                          subtitle: Text(AppList.recenttransaction[index]["dataone"], style: TextStyle(height: 1.5, fontSize: Get.width * 0.03)),
                          trailing: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                AppList.recenttransaction[index]["dattwo"],
                                style: TextStyle(color: index == 4 || index == 7 || index == 13 ? AppColor.blue : Colors.red.shade500, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 5),
                              Icon(Icons.arrow_forward_ios, size: Get.width * 0.05)
                            ],
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
