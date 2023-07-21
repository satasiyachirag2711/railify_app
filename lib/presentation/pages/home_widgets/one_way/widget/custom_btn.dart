import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:railify_app/utils/app_color.dart';

class CustomBtnone extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomBtnone({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.blue.shade50),
        minimumSize: MaterialStatePropertyAll(Size(Get.width, Get.height * 0.06)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold, color: AppColor.blue),
      ),
    );
  }
}
