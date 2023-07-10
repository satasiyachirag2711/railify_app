import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobleController extends GetxController {
  RangeValues rangeValues = RangeValues(0, 24);
  RangeValues ticketrange = RangeValues(0, 200);

  TextEditingController email = TextEditingController();
  TextEditingController bookingid = TextEditingController();
  TextEditingController cardnumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController pinput = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController updates = TextEditingController();
  TextEditingController returndate = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController idnumber = TextEditingController();
  TextEditingController redeem = TextEditingController();
  String country = "";
  dynamic selectedValue;
  dynamic selectedValuetwo;
  dynamic selectedValuethree;
  dynamic selectedValuefour;
  dynamic selectedValuefive;
  dynamic selectedValuesix;
  RxInt navigation = 0.obs;
  RxBool tab = true.obs;
  RxBool reivewswitch = true.obs;
  RxBool switc = false.obs;
  RxBool show = false.obs;
  RxBool hide = false.obs;
  RxBool help = false.obs;

  RxBool passenger = false.obs;
  int selectedRadioIndex = -1.obs;
  int ticketavilibility = -1.obs;
  int trainclass = -1.obs;
  int train = -1.obs;
  RxInt currentIndex = 0.obs;
  RxBool chacked = false.obs;
  DateTime selectedDate = DateTime.now();
  RxList<bool> isSelected = List.filled(35, false).obs;
  int payment = -1.obs;
  RxList select = [].obs;
  RxBool unselect = false.obs;
}
