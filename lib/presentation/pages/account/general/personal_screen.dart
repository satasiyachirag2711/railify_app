import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/account/account_screen.dart';
import 'package:railify_app/utils/app_color.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_textfield.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  final ImagePicker picker = ImagePicker();
  GlobleController global = Get.find();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Get.to(AccountScreen(
              image: image!.path,
            ));
          },
        ),
        title: const Text(
          "Personal Info",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [const Icon(Icons.edit)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Get.height * 0.04, left: Get.width * 0.3),
                    height: Get.height * 0.14,
                    width: Get.width * 0.3,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(Get.width),
                      image: image != null && image!.path != null
                          ? DecorationImage(
                              image: FileImage(File(image!.path)),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(1, 1)), padding: MaterialStatePropertyAll(EdgeInsets.all(4))),
                    onPressed: () => pickImage(),
                    child: Icon(
                      Icons.edit,
                      size: Get.width * 0.04,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.025),
                child: CustomTextFild(
                  hint: "Name",
                  controller: global.fullName,
                  leble: AppString.fullname,
                  icon: const Icon(Icons.person),
                  validator: (value) {
                    if (global.fullName.text.isEmpty) {
                      return "Please enter Name";
                    } else {
                      null;
                    }
                  },
                ),
              ),
              CustomTextFild(
                controller: TextEditingController(),
                hint: AppString.nationalidnumber,
                leble: AppString.nationalidnumber,
                numberKeyboard: true,
                icon: const Icon(Icons.person),
                validator: (value) {
                  if (global.fullName.text.isEmpty) {
                    return "Please enter Name";
                  } else {
                    null;
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.025),
                child: CustomTextFild(
                  hint: AppString.email,
                  controller: global.email,
                  validator: (value) {
                    if (global.email.text.isEmpty) {
                      return "Please enter Email";
                    } else if (global.email.text.isEmail == false) {
                      return "Please verified email";
                    } else {
                      null;
                    }
                  },
                  leble: AppString.email,
                  Icons: IconButton(onPressed: () {}, icon: const Icon(Icons.email_outlined)),
                ),
              ),
              Text(
                AppString.phone,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.032, color: AppColor.black),
              ),
              IntlPhoneField(
                controller: global.numberController,
                onCountryChanged: (val) {
                  global.country = val.dialCode;
                  debugPrint("===>======>phone code ${val.dialCode}");
                },
                style: TextStyle(fontSize: Get.width * 0.034, fontWeight: FontWeight.bold),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  counterText: "",
                  suffixIcon: const Icon(Icons.phone),
                  hintText: AppString.phone,
                ),
                initialCountryCode: "In",
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                child: TextField(
                  controller: global.date,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          selectDate(context);
                        },
                        icon: const Icon(Icons.calendar_month)),
                    hintText: AppString.birthdate,
                    label: const Text("Date of Birth"),
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.w400),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black38),
                    ),
                  ),
                ),
              ),
              Text(
                AppString.gender,
                style: TextStyle(fontWeight: FontWeight.w500, height: 2.4, fontSize: Get.width * 0.036),
              ),
              DropdownButtonFormField<String>(
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down_outlined, size: Get.width * 0.08),
                hint: Text(
                  AppString.gender,
                  style: TextStyle(fontWeight: FontWeight.w500, color: AppColor.black54, fontSize: Get.width * 0.038),
                ),
                value: global.selectedValuetwo,
                items: AppList.gender.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
                  );
                }).toList(),
                onChanged: (Value) {
                  global.selectedValuetwo = Value;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.02, left: Get.width * 0.3),
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(AccountScreen(image: image!.path));
                    },
                    child: const Text("Update")),
              )
            ],
          ),
        ),
      ),
    );
  }

  pickImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      print(image);
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
      global.date.text = DateFormat("dd/MM/yyyy").format(picked);
    }
  }
}
