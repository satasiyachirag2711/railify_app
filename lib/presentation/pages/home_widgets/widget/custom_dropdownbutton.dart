import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:railify_app/utils/app_color.dart';

class CustomDropDown extends StatelessWidget {
  final String hint;
  final String? value;
  InputDecoration? decoration;
  final void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  CustomDropDown({super.key, required this.hint, this.value, this.items, this.onChanged, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: TextStyle(fontWeight: FontWeight.w500, height: 2, fontSize: Get.width * 0.036),
        ),
        DropdownButtonFormField<String>(
          isExpanded: true,
          decoration: decoration,
          icon: Icon(Icons.keyboard_arrow_down_outlined, size: Get.width * 0.07),
          hint: Text(
            hint,
            style: TextStyle(fontWeight: FontWeight.w500, color: AppColor.black54, fontSize: Get.width * 0.038),
          ),
          value: value,
          items: items,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
