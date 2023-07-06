import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/search_result_screen.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../../controller/globle_controller.dart';
import '../../../../utils/App_list.dart';

class OneWayCustom extends StatefulWidget {
  const OneWayCustom({super.key});

  @override
  State<OneWayCustom> createState() => _OneWayCustomState();
}

class _OneWayCustomState extends State<OneWayCustom> {
  GlobleController globle = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          AppString.origin,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.036),
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.iron_sharp, size: Get.width * 0.06),
          ),
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down_outlined, size: Get.width * 0.08),
          hint: Text(
            AppString.origin,
            style: TextStyle(fontWeight: FontWeight.w500, color: AppColor.black54, fontSize: Get.width * 0.038),
          ),
          value: globle.selectedValue,
          items: AppList.origin.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (Value) {
            setState(() {
              globle.selectedValue = Value;
            });
          },
        ),
        Text(
          AppString.destination,
          style: TextStyle(fontWeight: FontWeight.w500, height: 2.4, fontSize: Get.width * 0.036),
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.iron_sharp, size: Get.width * 0.06),
          ),
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down_outlined, size: Get.width * 0.08),
          hint: Text(
            AppString.destination,
            style: TextStyle(fontWeight: FontWeight.w500, color: AppColor.black54, fontSize: Get.width * 0.038),
          ),
          value: globle.selectedValuetwo,
          items: AppList.desti.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (Value) {
            setState(() {
              globle.selectedValuetwo = Value;
            });
          },
        ),
        Text(
          AppString.departure,
          style: TextStyle(fontWeight: FontWeight.w500, height: 2.4, fontSize: Get.width * 0.036),
        ),
        TextField(
          controller: globle.date,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    selectDate(context);
                  });
                },
                icon: const Icon(Icons.calendar_month)),
            hintText: AppString.departure,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black38),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    AppString.train,
                    style: TextStyle(fontWeight: FontWeight.w500, height: 2.4, fontSize: Get.width * 0.036),
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.train, size: Get.width * 0.06),
                    ),
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down_outlined, size: Get.width * 0.08),
                    hint: Text(
                      AppString.train,
                      style: TextStyle(fontWeight: FontWeight.w500, color: AppColor.black54, fontSize: Get.width * 0.038),
                    ),
                    value: globle.selectedValuethree,
                    items: AppList.train.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (Value) {
                      setState(() {
                        globle.selectedValuethree = Value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  Text(
                    AppString.passenger,
                    style: TextStyle(fontWeight: FontWeight.w500, height: 2.4, fontSize: Get.width * 0.036),
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, size: Get.width * 0.06),
                    ),
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down_outlined, size: Get.width * 0.08),
                    hint: Text(
                      AppString.adult,
                      style: TextStyle(fontWeight: FontWeight.w500, color: AppColor.black54, fontSize: Get.width * 0.038),
                    ),
                    value: globle.selectedValuefour,
                    items: AppList.passenger.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (Value) {
                      setState(() {
                        globle.selectedValuefour = Value;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: Get.height * 0.03),
          child: CustomBtn(
            text: AppString.search,
            onPressed: () {
              Get.to(SearchResultScreen());
            },
          ),
        ),
      ],
    );
  }

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      globle.date.text = DateFormat("dd/MM/yyyy").format(picked);
      setState(() {});
    }
  }
}
