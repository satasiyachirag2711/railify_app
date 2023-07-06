import 'package:flutter/material.dart';
import 'package:railify_app/utils/app_images.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../utils/app_color.dart';

class CustomContinue extends StatelessWidget {
  final double top;
  final double bottom;
  const CustomContinue({super.key, required this.top, required this.bottom});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: top,
            bottom: bottom,
          ),
          child: Text(AppString.orcontinue, style: TextStyle(color: AppColor.black54, fontWeight: FontWeight.w500)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(color: Colors.black12)),
              child: Image.asset(AppImages.google, scale: 18),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(color: Colors.black12)),
              child: Image.asset(AppImages.apple, scale: 18),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(color: Colors.black12)),
              child: Image.asset(AppImages.facebook, scale: 18),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(color: Colors.black12)),
              child: Image.asset(AppImages.twitter, scale: 18),
            ),
          ],
        )
      ],
    );
  }
}
