import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/presentation/pages/home_page.dart';
import 'package:railify_app/presentation/widgets/customNavigatebotam.dart';
import 'package:railify_app/presentation/widgets/custom_textfield.dart';

import '../../../../controller/globle_controller.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';

class ShipingRateScreen extends StatefulWidget {
  final String title;
  final String titleone;
  const ShipingRateScreen({super.key, required this.title, required this.titleone});

  @override
  State<ShipingRateScreen> createState() => _ShipingRateScreenState();
}

class _ShipingRateScreenState extends State<ShipingRateScreen> {
  GlobleController globle = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.selectoutlet),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFild(
                icon: const Icon(Icons.location_on_rounded),
                enabled: false,
                leble: AppString.senderoutlet,
                hint: widget.title,
                controller: globle.senderoutlet,
              ),
              CustomTextFild(
                icon: const Icon(Icons.location_on_rounded),
                enabled: false,
                leble: AppString.receiveroutlet,
                hint: widget.titleone,
                controller: globle.receiveroutlet,
              ),
              CustomTextFild(
                icon: const Icon(Icons.line_weight),
                suffix: Text("Kg", style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold)),
                leble: AppString.weight,
                hint: AppString.weight,
                numberKeyboard: true,
                controller: globle.weight,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFild(
                      maxlength: 4,
                      suffix: Text("cm", style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold)),
                      leble: AppString.lenght,
                      hint: AppString.lenght,
                      numberKeyboard: true,
                      controller: globle.length,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomTextFild(
                        maxlength: 4,
                        suffix: Text("cm", style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold)),
                        leble: AppString.width,
                        hint: AppString.width,
                        numberKeyboard: true,
                        controller: globle.width,
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomTextFild(
                      maxlength: 4,
                      suffix: Text("cm", style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold)),
                      leble: AppString.height,
                      hint: AppString.height,
                      numberKeyboard: true,
                      controller: globle.height,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBotamNavigate(
        text: AppString.checkshiping,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            context: context,
            builder: (context) => Container(
              height: Get.height * 0.74,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(Get.height * 0.04)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    AppString.shippingrat,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.048),
                  ),
                  const Divider(),
                  Container(
                    height: Get.height * 0.55,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: Image.asset(AppImages.cube, color: AppColor.grey, scale: 9),
                          title: Text(
                            "${widget.title}-${widget.titleone}",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038),
                          ),
                          subtitle: Text(AppString.estimatedtime, style: TextStyle(color: AppColor.black54, height: 2, fontSize: Get.width * 0.036)),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppString.weight, style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.036)),
                                Text(
                                  globle.weight.text,
                                  style: TextStyle(fontWeight: FontWeight.w500, height: 2, fontSize: Get.width * 0.038),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.1, child: const VerticalDivider()),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("volume", style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.036)),
                                Text(
                                  "375,000 cm3",
                                  style: TextStyle(fontWeight: FontWeight.w500, height: 2, fontSize: Get.width * 0.038),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppString.lenght, style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.036)),
                                Text(
                                  globle.length.text,
                                  style: TextStyle(fontWeight: FontWeight.w500, height: 2, fontSize: Get.width * 0.038),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.1, child: const VerticalDivider()),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppString.width, style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.036)),
                                Text(
                                  globle.width.text,
                                  style: TextStyle(fontWeight: FontWeight.w500, height: 2, fontSize: Get.width * 0.038),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.1, child: const VerticalDivider()),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppString.height, style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.036)),
                                Text(
                                  globle.height.text,
                                  style: TextStyle(fontWeight: FontWeight.w500, height: 2, fontSize: Get.width * 0.038),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(),
                        Container(
                          height: Get.height * 0.06,
                          decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "\$50.00",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.035),
                          )),
                        ),
                        Text(AppString.ratesarecalculated, style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.036)),
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height * 0.06,
                    width: Get.width,
                    decoration: BoxDecoration(border: Border.all(color: AppColor.blue, width: 2), borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                        onPressed: () {
                          Get.off(const HomePage());
                        },
                        child: Text(
                          AppString.close,
                          style: TextStyle(color: AppColor.blue),
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
