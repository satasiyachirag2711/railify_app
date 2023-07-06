import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobleController extends GetxController {
  RangeValues rangeValues = RangeValues(0, 24);
  RangeValues ticketrange = RangeValues(0, 200);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController pinput = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController fullName = TextEditingController();

  dynamic selectedValue;
  dynamic selectedValuetwo;
  dynamic selectedValuethree;
  dynamic selectedValuefour;
  RxInt navigation = 0.obs;
  bool tab = true;
  int selectedRadioIndex = -1;
  int ticketavilibility = -1;
  int trainclass = -1;
  int train = -1;
  bool chacked = false;
  String otp = "";
  DateTime selectedDate = DateTime.now();
}
