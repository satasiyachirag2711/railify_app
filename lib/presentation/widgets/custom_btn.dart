import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:railify_app/utils/app_color.dart';

class CustomBtn extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomBtn({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AppColor.blue),
        minimumSize: MaterialStatePropertyAll(Size(Get.width, Get.height * 0.06)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold, color: AppColor.white),
      ),
    );
  }
}
