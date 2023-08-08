import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/select_seat_screen.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_dropdownbutton.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_trip_details.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/presentation/widgets/custom_textfield.dart';
import 'package:railify_app/utils/App_list.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../../utils/app_color.dart';

class BookingDetailScreen extends StatefulWidget {
  final String image;
  final String title;
  final String trailing;
  final String date;
  final String leading;
  final String trailingtwo;

  const BookingDetailScreen({super.key, required this.image, required this.title, required this.trailing, required this.leading, required this.trailingtwo, required this.date});

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  GlobleController global = Get.find();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.bookingdetail,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.tripdetail,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.045),
                  ),
                  CustomTripDetails(image: widget.image, title: widget.title, date: widget.date, leading: widget.leading, trailingtwo: widget.trailingtwo, trailing: "\$${widget.trailing}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.contackdetail,
                        style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.edit,
                        color: AppColor.blue,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                    height: Get.height * 0.38,
                    width: Get.width,
                    margin: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFild(
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
                              return null;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: Get.height * 0.03),
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
                                return null;
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
                        ],
                      ),
                    ),
                  ),
                  Text(
                    AppString.passengerdetails,
                    style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                    height: global.show.value == false ? Get.height * 0.5 : Get.height * 0.3,
                    width: Get.width,
                    margin: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(
                              AppString.passenger1,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.042),
                            ),
                            leading: Icon(Icons.airline_seat_recline_normal_rounded, color: AppColor.black, size: Get.width * 0.07),
                            trailing: IconButton(
                              onPressed: () {
                                global.show.value = !global.show.value;
                              },
                              icon: Icon(global.show.value ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined, color: AppColor.black, size: Get.width * 0.07),
                            ),
                          ),
                          const Divider(),
                          global.show.value == false
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          AppString.sameas,
                                          style: TextStyle(fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                                        ),
                                        Switch(
                                          value: global.switc.value,
                                          onChanged: (value) {
                                            global.switc.value = !global.switc.value;
                                          },
                                        )
                                      ],
                                    ),
                                    const Divider(),
                                    CustomTextFild(
                                      hint: "Name",
                                      controller: global.fullName,
                                      leble: AppString.fullname,
                                      icon: const Icon(Icons.person),
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: CustomDropDown(
                                            hint: "ID Type",
                                            value: global.onefive,
                                            items: AppList.idtype.map<DropdownMenuItem<String>>((value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                global.onefive = value;
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 12),
                                            child: CustomTextFild(
                                              numberKeyboard: true,
                                              hint: AppString.idnumber,
                                              controller: global.idnumber,
                                              leble: AppString.idnumber,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    CustomDropDown(
                                      hint: "Passenger Type",
                                      value: global.onesix,
                                      items: AppList.passengertype.map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          global.onesix = value;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height * 0.06,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.green.shade50),
                    child: Center(
                      child: Text(
                        AppString.addmore,
                        style: TextStyle(color: AppColor.blue, fontSize: Get.width * 0.035, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomBtn(
              text: AppString.conti,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Get.to(
                    SelectSeatScreen(
                        idnumber: global.idnumber.text,
                        idtype: global.onefive,
                        passengertype: global.onesix,
                        title: widget.title,
                        trailing: widget.trailing,
                        leading: widget.leading,
                        trailingtwo: widget.trailingtwo,
                        date: widget.date,
                        image: widget.image,
                        email: global.email.text,
                        name: global.fullName.text,
                        phonenumber: global.country.isEmpty ? "+91${global.numberController.text}" : "+ ${global.country + global.numberController.text}"),
                  );
                }
              }),
        ),
      ),
    );
  }
}
