import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/refund_calculation/refund_calculation_two_screen.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_dropdownbutton.dart';
import 'package:railify_app/presentation/widgets/custom_textfield.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../../utils/App_list.dart';
import '../../../widgets/custom_btn.dart';

class RefundCalculationScreen extends StatefulWidget {
  final String title;
  const RefundCalculationScreen({super.key, required this.title});

  @override
  State<RefundCalculationScreen> createState() => _RefundCalculationScreenState();
}

class _RefundCalculationScreenState extends State<RefundCalculationScreen> {
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
                Text(
                  AppString.departure,
                  style: TextStyle(fontWeight: FontWeight.w500, height: 2.4, fontSize: Get.width * 0.036),
                ),
                TextField(
                  controller: globle.date,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          selectDate(context);
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
                Text(
                  AppString.departing,
                  style: TextStyle(fontWeight: FontWeight.w500, height: 2.4, fontSize: Get.width * 0.036),
                ),
                TextField(
                  controller: globle.starttime,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () async {
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (picked != null) {
                            setState(() {
                              globle.starttime.text = picked.format(context);
                            });
                          }
                        },
                        icon: const Icon(Icons.access_time)),
                    hintText: AppString.departing,
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black38),
                    ),
                  ),
                ),
                CustomDropDown(
                  hint: "${AppString.origin} Station",
                  value: globle.refundone,
                  items: AppList.origin.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      globle.refundone = value;
                    });
                  },
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.iron_sharp)),
                ),
                CustomDropDown(
                  hint: "${AppString.destination} Station",
                  value: globle.refundtwo,
                  items: AppList.desti.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      globle.refundtwo = value;
                    });
                  },
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.iron_sharp)),
                ),
                Text(
                  AppString.passenger,
                  style: TextStyle(fontWeight: FontWeight.w500, height: 2.4, fontSize: Get.width * 0.038),
                ),
                Container(
                  height: Get.height * 0.15,
                  margin: const EdgeInsets.symmetric(vertical: 25),
                  child: GridView.builder(
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, mainAxisExtent: Get.height * 0.06, mainAxisSpacing: 10, crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        bool isSelected = index == globle.train;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                globle.train = -1; // Unselect the item if it's already selected
                              } else {
                                globle.train = index; // Select the tapped item
                              }
                            });
                          },
                          child: Container(
                            width: Get.width * 0.06,
                            decoration: BoxDecoration(color: isSelected ? AppColor.blue : AppColor.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColor.blue, width: 2)),
                            child: Center(
                              child: Text(
                                globle.passengerList[index].toString(),
                                style: TextStyle(fontWeight: FontWeight.w500, color: isSelected ? AppColor.white : AppColor.blue, fontSize: Get.width * 0.05),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomDropDown(
                        hint: AppString.train,
                        value: globle.refundthree,
                        items: AppList.train.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          globle.refundthree = value;
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomTextFild(
                        maxlength: 4,
                        icon: Icon(
                          Icons.attach_money,
                          color: AppColor.black,
                        ),
                        numberKeyboard: true,
                        hint: "Ticket Amount",
                        controller: globle.note,
                        leble: "Ticket Amount",
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: CustomBtn(
                    text: "Calculation Refund",
                    onPressed: () {
                      Get.to(RefundCalculationTwo(title: widget.title, departuredate: globle.date.text, departuretime: globle.starttime.text, origin: globle.refundone, destination: globle.refundtwo, passenger: globle.train.toString(), train: globle.refundthree, ticket: globle.note.text));
                    }))));
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
