import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../utils/app_color.dart';

class CustomTextFild extends StatelessWidget {
  final String hint;
  final String leble;
  final bool whit;
  final bool cngsize;
  final bool margin;
  final bool max;
  IconButton? Icons;
  Icon? icon;
  final bool obsertext;
  final TextEditingController controller;
  final Function? onChange;
  final String? Function(String?)? validator;
  final Widget? button;
  final bool numberKeyboard;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? inputType;

  CustomTextFild({
    Key? key,
    required this.hint,
    required this.controller,
    this.whit = false,
    this.cngsize = false,
    this.margin = false,
    this.onChange,
    this.max = false,
    this.obsertext = true,
    this.button,
    this.numberKeyboard = false,
    this.inputFormatter,
    this.inputType,
    required this.leble,
    this.Icons,
    this.icon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          leble,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.036),
        ),
        TextFormField(
          validator: validator,
          cursorColor: AppColor.grey,
          keyboardType: numberKeyboard ? TextInputType.number : TextInputType.emailAddress,
          obscureText: obsertext,
          maxLines: max ? 4 : 1,
          textAlign: cngsize ? TextAlign.center : TextAlign.start,
          controller: controller,
          style: TextStyle(fontSize: Get.width * 0.04, color: AppColor.black, fontWeight: FontWeight.w500),
          onChanged: (String value) {},
          decoration: InputDecoration(
            suffixIcon: Icons,
            hintText: hint,
            prefixIcon: icon,
            hintStyle: TextStyle(
              fontSize: Get.width * 0.034,
              color: AppColor.black,
            ),
          ),
        ),
      ],
    );
  }
}
