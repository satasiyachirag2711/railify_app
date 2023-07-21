import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:railify_app/utils/app_images.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../utils/app_color.dart';

class CustomPopup extends StatelessWidget {
  final String text;
  const CustomPopup({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(10)),
      height: Get.height * 0.55,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              AppImages.verify,
              width: Get.width,
              height: Get.height * 0.3,
              fit: BoxFit.cover,
            ),
            Text(text, style: TextStyle(color: AppColor.blue, height: 1.5, fontSize: Get.width * 0.05, fontWeight: FontWeight.bold)),
            SizedBox(height: Get.height * 0.03),
            Text(AppString.pleasewait, style: TextStyle(color: AppColor.black, fontSize: Get.width * 0.03)),
            Text(AppString.youwill_homepage, style: TextStyle(color: AppColor.black, height: 1.2, fontSize: Get.width * 0.03)),
            const SizedBox(height: 20),
            SpinKitCircle(
              size: Get.width * 0.15,
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(color: AppColor.blue, shape: BoxShape.circle),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
