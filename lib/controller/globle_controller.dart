import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GlobleController extends GetxController {
  RangeValues rangeValues = RangeValues(0, 24);
  RangeValues ticketrange = RangeValues(0, 200);
  RxDouble sliderValue = 0.0.obs;

  TextEditingController email = TextEditingController();
  TextEditingController bookingid = TextEditingController();
  TextEditingController cardnumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController pinput = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController datetwo = TextEditingController();
  TextEditingController updates = TextEditingController();
  TextEditingController returndate = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController idnumber = TextEditingController();
  TextEditingController redeem = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController starttime = TextEditingController();
  TextEditingController endtime = TextEditingController();
  TextEditingController senderoutlet = TextEditingController();
  TextEditingController receiveroutlet = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController length = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController topup = TextEditingController();
  // TextEditingController endtime = TextEditingController();
  String country = "";
  String searchText = '';
  List<String> shippingrate = [];
  List<int> selectedIndices = [];

  dynamic oneone;
  dynamic onetwo;
  dynamic onethree;
  dynamic onefour;
  dynamic onefive;
  dynamic onesix;
  dynamic roundone;
  dynamic roundtwo;
  dynamic roundthree;
  dynamic roundfour;
  dynamic roundfive;
  dynamic roundsix;
  dynamic stationone;
  dynamic stationtwo;
  dynamic stationthree;
  dynamic fareone;
  dynamic faretwo;
  dynamic shedule;
  dynamic statusone;
  dynamic statustwo;
  dynamic refundone;
  dynamic refundtwo;
  dynamic refundthree;
  dynamic bookingone;
  dynamic bookingtwo;
  dynamic availabilityone;
  dynamic availabilitytwo;
  dynamic availabilitythree;
  dynamic passengerone;
  dynamic passengertwo;
  dynamic personal;
  RxInt navigation = 0.obs;
  RxBool showContainer = false.obs;
  RxBool tab = true.obs;
  RxDouble total = 0.00.obs;
  RxDouble number = 0.00.obs;
  RxBool reivewswitch = true.obs;
  RxBool switc = false.obs;
  RxBool show = false.obs;
  RxBool hide = false.obs;
  RxBool help = false.obs;
  RxList<int> demo = RxList<int>([0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
  RxList passengerList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].obs;
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
  RxList<Map> basket = [{}].obs;
  List data = [];

  Future<List> getUsers() async {
    String jsonString = await rootBundle.loadString('assets/trains.json');

    List<dynamic> jsonList = json.decode(jsonString);

    data = jsonList;
    print(data);

    return data;
  }
}
