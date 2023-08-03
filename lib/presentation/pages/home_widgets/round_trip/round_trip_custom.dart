import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/presentation/pages/home_widgets/round_trip/round_select_departure.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_dropdownbutton.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/presentation/widgets/custom_textfield.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../../controller/globle_controller.dart';
import '../../../../utils/App_list.dart';

class RoundTripCustom extends StatefulWidget {
  const RoundTripCustom({super.key});

  @override
  State<RoundTripCustom> createState() => _RoundTripCustomState();
}

class _RoundTripCustomState extends State<RoundTripCustom> {
  GlobleController globle = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomDropDown(
                decoration: InputDecoration(prefixIcon: Icon(Icons.iron_sharp)),
                hint: AppString.origin,
                value: globle.roundone,
                items: AppList.origin.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    globle.roundone = value;
                  });
                }),
            CustomDropDown(
                decoration: InputDecoration(prefixIcon: Icon(Icons.iron_sharp)),
                hint: AppString.destination,
                value: globle.roundtwo,
                items: AppList.desti.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    globle.roundtwo = value;
                  });
                }),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomTextFild(
                    controller: globle.datetwo,
                    Icons: IconButton(
                        onPressed: () {
                          selectDate(context);
                        },
                        icon: const Icon(Icons.calendar_month)),
                    hint: AppString.departure,
                    leble: AppString.departure,
                  ),
                ),
                SizedBox(width: Get.width * 0.04),
                Expanded(
                  child: CustomTextFild(
                    controller: globle.returndate,
                    Icons: IconButton(
                        onPressed: () {
                          selectDate(context);
                        },
                        icon: const Icon(Icons.calendar_month)),
                    hint: AppString.returndate,
                    leble: AppString.returndate,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomDropDown(
                      decoration: InputDecoration(prefixIcon: Icon(Icons.train)),
                      hint: AppString.train,
                      value: globle.roundthree,
                      items: AppList.train.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          globle.roundthree = value;
                        });
                      }),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: CustomDropDown(
                      decoration: InputDecoration(prefixIcon: Icon(Icons.person)),
                      hint: AppString.passenger,
                      value: globle.roundfour,
                      items: AppList.passenger.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          globle.roundfour = value;
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
                  Get.to(const SelectDepartureTrain());
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
      globle.datetwo.text = DateFormat("dd/MM/yyyy").format(picked);
    }
  }
}
