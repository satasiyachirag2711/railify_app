import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/search_result_screen.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_dropdownbutton.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../../controller/globle_controller.dart';
import '../../../../utils/App_list.dart';
import '../../../widgets/custom_textfield.dart';

class OneWayCustom extends StatefulWidget {
  const OneWayCustom({super.key});

  @override
  State<OneWayCustom> createState() => _OneWayCustomState();
}

class _OneWayCustomState extends State<OneWayCustom> {
  GlobleController globle = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomDropDown(
              hint: AppString.origin,
              value: globle.selectedValue,
              items: AppList.origin.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  globle.selectedValue = value;
                });
              },
              decoration: const InputDecoration(prefixIcon: Icon(Icons.iron_sharp)),
            ),
            CustomDropDown(
              hint: AppString.destination,
              value: globle.selectedValuetwo,
              items: AppList.desti.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  globle.selectedValuetwo = value;
                });
              },
              decoration: const InputDecoration(prefixIcon: Icon(Icons.iron_sharp)),
            ),
            const SizedBox(height: 20),
            CustomTextFild(
              controller: globle.date,
              Icons: IconButton(
                  onPressed: () {
                    selectDate(context);
                  },
                  icon: const Icon(Icons.calendar_month)),
              hint: AppString.departure,
              leble: AppString.departure,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomDropDown(
                    hint: AppString.train,
                    value: globle.selectedValuethree,
                    items: AppList.train.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        globle.selectedValuethree = value;
                      });
                    },
                    decoration: InputDecoration(prefixIcon: Icon(Icons.train)),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomDropDown(
                      hint: AppString.adult,
                      value: globle.selectedValuefour,
                      decoration: InputDecoration(prefixIcon: Icon(Icons.person)),
                      items: AppList.passenger.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          globle.selectedValuefour = value;
                        });
                      }),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.03),
              child: CustomBtn(
                text: AppString.search,
                onPressed: () {
                  Get.to(const SearchResultScreen());
                },
              ),
            ),
          ],
        ),
      );
    });
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
    }
  }
}
