import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/presentation/widgets/custom_textfield.dart';
import 'package:railify_app/utils/App_list.dart';
import 'package:railify_app/utils/app_color.dart';

import '../../../../utils/app_string.dart';

class PassengerList extends StatefulWidget {
  final String name;
  final String fullName;

  PassengerList({super.key, required this.name, required this.fullName});

  @override
  State<PassengerList> createState() => _PassengerListState();
}

class _PassengerListState extends State<PassengerList> {
  GlobleController globle = Get.find();
  @override
  void initState() {
    if (widget.fullName.isNotEmpty) {
      AppList.passengerList.add(widget.fullName);
      print("===============><>${AppList.passengerList}");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        bottom: AppBar(
          leading: const SizedBox(),
          title: Row(
            children: [
              const Text("No."),
              const SizedBox(width: 40),
              const Text("Name"),
            ],
          ),
          leadingWidth: 1,
        ),
      ),
      body: ListView.builder(
        itemCount: AppList.passengerList.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: index % 2 == 0 ? Colors.white : Colors.transparent,
            leading: Text((index + 1).toString(), style: const TextStyle(fontWeight: FontWeight.bold)), // Print the value of index + 1 as the leading text
            title: Text(AppList.passengerList[index], style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: IconButton(
                onPressed: () {
                  globle.fullName.clear();
                  globle.idnumber.clear();
                  Get.to(EditPassenger(
                    name: AppList.passengerList[index],
                  ));
                },
                icon: Icon(
                  Icons.edit,
                  color: AppColor.blue,
                )),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: CustomBtn(
              onPressed: () {
                Get.to(const AddPassenger());
              },
              text: AppString.addpassenger),
        ),
      ),
    );
  }
}

class AddPassenger extends StatefulWidget {
  const AddPassenger({super.key});

  @override
  State<AddPassenger> createState() => _AddPassengerState();
}

class _AddPassengerState extends State<AddPassenger> {
  GlobleController globle = Get.find();
  RxBool maleSelected = false.obs;
  RxBool femaleSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.addnewpassenger),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFild(
              hint: "Name",
              controller: globle.fullName,
              leble: AppString.fullname,
              icon: Icon(Icons.person),
              validator: (value) {
                if (globle.fullName.text.isEmpty) {
                  return "Please enter Name";
                } else {
                  null;
                }
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ID Type",
                        style: TextStyle(fontWeight: FontWeight.w500, height: 2.4, fontSize: Get.width * 0.036),
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down_outlined, size: Get.width * 0.08),
                        hint: Text(
                          "ID Type",
                          style: TextStyle(fontWeight: FontWeight.w500, color: AppColor.black54, fontSize: Get.width * 0.038),
                        ),
                        value: globle.selectedValuefive,
                        items: AppList.idtype.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            globle.selectedValuefive = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFild(
                        numberKeyboard: true,
                        hint: AppString.idnumber,
                        controller: globle.idnumber,
                        leble: AppString.idnumber,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              AppString.gender,
              style: TextStyle(fontWeight: FontWeight.w500, height: 2, fontSize: Get.width * 0.036),
            ),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle selection logic for male option
                      maleSelected.value = true;
                      femaleSelected.value = false;
                    },
                    child: Container(
                      width: Get.width * 0.4,
                      height: Get.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: maleSelected.value ? AppColor.blue : Colors.grey),
                        color: maleSelected.value ? AppColor.blue : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          AppString.male,
                          style: TextStyle(
                            color: maleSelected.value ? Colors.white : AppColor.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle selection logic for female option
                      maleSelected.value = false;
                      femaleSelected.value = true;
                    },
                    child: Container(
                      width: Get.width * 0.4,
                      height: Get.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: femaleSelected.value ? AppColor.blue : Colors.grey),
                        color: femaleSelected.value ? AppColor.blue : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          AppString.female,
                          style: TextStyle(
                            color: femaleSelected.value ? Colors.white : AppColor.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
            Text(
              AppString.birthdate,
              style: TextStyle(fontWeight: FontWeight.w500, height: 2, fontSize: Get.width * 0.036),
            ),
            TextField(
              controller: globle.date,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      selectDate(context);
                    },
                    icon: const Icon(Icons.calendar_month)),
                hintText: AppString.birthdate,
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.black38),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomBtn(
              onPressed: () {
                Get.to(PassengerList(
                  name: "",
                  fullName: globle.fullName.text,
                ));
              },
              text: AppString.save),
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

class EditPassenger extends StatefulWidget {
  final String name;
  const EditPassenger({super.key, required this.name});

  @override
  State<EditPassenger> createState() => _EditPassengerState();
}

class _EditPassengerState extends State<EditPassenger> {
  GlobleController globle = Get.find();
  RxBool maleSelected = false.obs;
  RxBool femaleSelected = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.editpassenger),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFild(
              hint: widget.name,
              controller: globle.fullName,
              leble: AppString.fullname,
              icon: Icon(Icons.person),
              validator: (value) {
                if (globle.fullName.text.isEmpty) {
                  return "Please enter Name";
                } else {
                  null;
                }
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ID Type",
                        style: TextStyle(fontWeight: FontWeight.w500, height: 2.4, fontSize: Get.width * 0.036),
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down_outlined, size: Get.width * 0.08),
                        hint: Text(
                          "ID Type",
                          style: TextStyle(fontWeight: FontWeight.w500, color: AppColor.black54, fontSize: Get.width * 0.038),
                        ),
                        value: globle.selectedValuefive,
                        items: AppList.idtype.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            globle.selectedValuefive = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFild(
                        numberKeyboard: true,
                        hint: AppString.idnumber,
                        controller: globle.idnumber,
                        leble: AppString.idnumber,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              AppString.gender,
              style: TextStyle(fontWeight: FontWeight.w500, height: 2, fontSize: Get.width * 0.036),
            ),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle selection logic for male option
                      maleSelected.value = true;
                      femaleSelected.value = false;
                    },
                    child: Container(
                      width: Get.width * 0.4,
                      height: Get.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: maleSelected.value ? AppColor.blue : Colors.grey),
                        color: maleSelected.value ? AppColor.blue : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          AppString.male,
                          style: TextStyle(
                            color: maleSelected.value ? Colors.white : AppColor.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle selection logic for female option
                      maleSelected.value = false;
                      femaleSelected.value = true;
                    },
                    child: Container(
                      width: Get.width * 0.4,
                      height: Get.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: femaleSelected.value ? AppColor.blue : Colors.grey),
                        color: femaleSelected.value ? AppColor.blue : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          AppString.female,
                          style: TextStyle(
                            color: femaleSelected.value ? Colors.white : AppColor.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
            Text(
              AppString.birthdate,
              style: TextStyle(fontWeight: FontWeight.w500, height: 2, fontSize: Get.width * 0.036),
            ),
            TextField(
              controller: globle.date,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      selectDate(context);
                    },
                    icon: const Icon(Icons.calendar_month)),
                hintText: AppString.birthdate,
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.black38),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomBtn(
              onPressed: () {
                Get.to(PassengerList(
                  name: "",
                  fullName: globle.fullName.text,
                ));
              },
              text: AppString.update),
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
