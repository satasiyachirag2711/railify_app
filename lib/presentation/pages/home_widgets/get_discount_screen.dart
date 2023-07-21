import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_images.dart';

import '../../../utils/app_string.dart';

class GetDiscountScreen extends StatefulWidget {
  const GetDiscountScreen({super.key});

  @override
  State<GetDiscountScreen> createState() => _GetDiscountScreenState();
}

class _GetDiscountScreenState extends State<GetDiscountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppImages.distwo), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(Get.width * 0.08),
                  ),
                  height: Get.height * 0.25,
                  width: Get.width),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppString.get25off,
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: Get.width * 0.043,
                        height: 1.6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: Get.width * 0.05),
                    Icon(Icons.keyboard_arrow_right, color: AppColor.blue),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  AppString.limited,
                  style: TextStyle(
                    color: AppColor.black54,
                    fontSize: Get.width * 0.033,
                    height: 2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.grey.shade100),
                    elevation: const MaterialStatePropertyAll(0),
                    minimumSize: MaterialStatePropertyAll(
                      Size(Get.width, Get.height * 0.06),
                    ),
                  ),
                  child: Text(
                    AppString.vx79,
                    style: TextStyle(color: AppColor.black, fontSize: Get.width * 0.04),
                  ),
                ),
              ),
              Text(
                AppString.aboutheoffer,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: Get.width * 0.043,
                  height: 1.6,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                AppString.get25discount,
                style: TextStyle(
                  color: AppColor.black54,
                  fontSize: Get.width * 0.033,
                  height: 1.6,
                ),
              ),
              Text(
                AppString.termscondition,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: Get.width * 0.043,
                  height: 1.6,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                AppString.theofferisvalid,
                style: TextStyle(
                  color: AppColor.black54,
                  fontSize: Get.width * 0.033,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomBtn(
            text: AppString.usediscount,
            onPressed: () async {},
          ),
        ),
      ),
    );
  }
}
