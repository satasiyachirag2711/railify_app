import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:railify_app/presentation/pages/home_widgets/re_schedule/shedule_select_seat.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_dropdownbutton.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_trip_details.dart';
import 'package:railify_app/presentation/widgets/customNavigatebotam.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../../controller/globle_controller.dart';
import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';
import '../../../widgets/custom_textfield.dart';

class SheduleBookingScreen extends StatefulWidget {
  final String image;
  final String title;
  final String timeOne;
  final String timeTwo;
  final String timeThree;
  final String timeFour;
  final String date;
  final String dateTwo;
  final String subtitle;
  final String subtitletwo;
  final String imagetwo;
  final String titletwo;
  final String price;

  const SheduleBookingScreen({super.key, required this.image, required this.title, required this.timeOne, required this.timeTwo, required this.timeThree, required this.timeFour, required this.date, required this.dateTwo, required this.subtitle, required this.subtitletwo, required this.imagetwo, required this.titletwo, required this.price});

  @override
  State<SheduleBookingScreen> createState() => _SheduleBookingScreenState();
}

class _SheduleBookingScreenState extends State<SheduleBookingScreen> {
  GlobleController global = Get.find();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppString.bookingdetail), centerTitle: true),
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
                    "${AppString.tripdetail} (${AppString.departure})",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.045),
                  ),
                  CustomTripDetails(
                    tr: 0,
                    image: widget.image,
                    title: widget.title,
                    date: widget.date,
                    leading: widget.timeOne,
                    trailingtwo: widget.timeTwo,
                    subtitle: widget.subtitle,
                  ),
                  Text(
                    "${AppString.tripdetail} (Return)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.045),
                  ),
                  CustomTripDetails(
                    trailing: "\$${widget.price}",
                    image: widget.imagetwo,
                    title: widget.titletwo,
                    date: widget.dateTwo,
                    leading: widget.timeThree,
                    trailingtwo: widget.timeFour,
                    subtitle: widget.subtitletwo,
                  ),
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
                    height: Get.height * 0.34,
                    width: Get.width,
                    margin: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                    child: SingleChildScrollView(
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
                    height: global.show.value == false ? Get.height * 0.52 : Get.height * 0.15,
                    width: Get.width,
                    margin: EdgeInsets.symmetric(vertical: Get.height * 0.03),
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
                        if (global.show.value == false)
                          Column(
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
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: CustomDropDown(
                                            hint: "ID Type",
                                            items: AppList.idtype.map<DropdownMenuItem<String>>((value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                global.selectedValuefive = value;
                                              });
                                            },
                                            value: global.selectedValuefive)),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: CustomTextFild(
                                        numberKeyboard: true,
                                        hint: AppString.idnumber,
                                        controller: global.idnumber,
                                        leble: AppString.idnumber,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              CustomDropDown(
                                  hint: "Passenger Type",
                                  items: AppList.passengertype.map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      global.selectedValuesix = value;
                                    });
                                  },
                                  value: global.selectedValuesix)
                            ],
                          )
                        else
                          const SizedBox(),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
      bottomNavigationBar: CustomBotamNavigate(
          text: AppString.conti,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Get.to(SheduleSelectSeat(
                  idnumber: global.idnumber.text,
                  idtype: global.selectedValuefive,
                  passengertype: global.selectedValuesix,
                  subtitletwo: widget.subtitletwo,
                  imagetwo: widget.imagetwo,
                  price: widget.price,
                  name: global.fullName.text,
                  dateTwo: widget.dateTwo,
                  timeFour: widget.timeThree,
                  timeThree: widget.timeFour,
                  titletwo: widget.titletwo,
                  email: global.email.text,
                  phonenumber: global.country.isEmpty ? "+91${global.numberController.text}" : "+ ${global.country + global.numberController.text}"));
            }
          }),
    );
  }
}
