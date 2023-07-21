import 'package:flutter/material.dart';
import 'package:railify_app/utils/app_color.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: LinearProgressIndicator(
        backgroundColor: Colors.black12,
        minHeight: 8,
        value: 0.3,
        valueColor: AlwaysStoppedAnimation(AppColor.white),
      ),
    );
  }
}
