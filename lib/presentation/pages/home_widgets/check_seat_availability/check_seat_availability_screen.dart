import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/presentation/pages/home_widgets/check_seat_availability/check_seat_availability_two_screen.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_dropdownbutton.dart';
import 'package:railify_app/presentation/widgets/custom_textfield.dart';

import '../../../../controller/globle_controller.dart';
import '../../../../utils/App_list.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_btn.dart';

class CheckSeatAvailability extends StatefulWidget {
  final String title;
  const CheckSeatAvailability({super.key, required this.title});

  @override
  State<CheckSeatAvailability> createState() => _CheckSeatAvailabilityState();
}

class _CheckSeatAvailabilityState extends State<CheckSeatAvailability> {
  GlobleController globle = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomDropDown(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.iron_sharp)),
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
                  }),
              CustomDropDown(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.iron_sharp)),
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
                  }),
              SizedBox(height: 10),
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
              CustomDropDown(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.train)),
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
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomBtn(
            text: "Check Seat",
            onPressed: () {
              if (globle.date.text.isNotEmpty) {
                Get.to(CheckSeatAvailabilityTwo(title: widget.title));
              }
              globle.date.clear();
            },
          ),
        ),
      ),
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
    }
  }
}
