import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/utils/app_images.dart';
import 'package:railify_app/utils/app_string.dart';

class AppList {
  static RxList<String> origin = ["Apex Square", "Aurora Point", "Cosmos Junction", "Equinox Depot", "Epicenter Station", "Future Oasis Station", "Fusion Heights", "Fusion Square", "Fusion Station"].obs;
  static RxList<String> desti = [
    "Epicenter Station",
    "Future Oasis Station",
    "Fusion Station",
    "Luminous Station",
    "Proxima Station",
    "Skylight Station",
    "Solaris Station",
    "South Station",
    "Stellar Station",
  ].obs;
  static RxList<String> train = ["All Class", "Executive", "Business", "Economy"].obs;
  static RxList<String> passenger = ["0 Adult", "1 Adult", "2 Adult", "3 Adult", "4 Adult", "5 Adult"].obs;

  static RxList<Map<String, dynamic>> checkBooking = [
    {"image": AppImages.ticket, "data": "Check\nBooking"},
    {"image": AppImages.calender, "data": "Re-\nSchedule"},
    {"image": AppImages.calenderone, "data": "Train\nCancellation"},
    {"image": AppImages.cutlery, "data": "Order\nTrain Food"},
    {"image": AppImages.seat, "data": "Check Seat\nAvailability"},
    {"image": AppImages.train, "data": "Train Live\nStatus"},
    {"image": AppImages.calendertwo, "data": "Train\nSchedule"},
    {"image": AppImages.letter, "data": "Train Line\nInformation"},
    {"image": AppImages.doller, "data": "Train\nFare"},
    {"image": AppImages.refund, "data": "Refund\nCalculation"},
    {"image": AppImages.clock, "data": "Station\nAlarm"},
    {"image": AppImages.cube, "data": "Shipping\nRates"},
  ].obs;

  static RxList<Map<String, dynamic>> notification = [
    {"image": AppImages.notithree, "dataOne": AppString.security, "datatwo": AppString.today, "datathree": AppString.nowrailify},
    {"image": AppImages.notitwo, "dataOne": AppString.multiple, "datatwo": AppString.day1, "datathree": AppString.nowyou},
    {"image": AppImages.notione, "dataOne": AppString.newupdate, "datatwo": AppString.days2, "datathree": AppString.updaterailify},
    {"image": AppImages.notitwo, "dataOne": AppString.creditcard, "datatwo": AppString.days3, "datathree": AppString.yourcredit},
    {"image": AppImages.user, "dataOne": AppString.account, "datatwo": AppString.dec, "datathree": AppString.youraccount},
  ].obs;

  static RxList<Map<String, dynamic>> search = [
    {"image": "assets/images/search_one.jpeg", "data1": "Amtrak", "data2": "40.00", "data3": "08:00", "data4": "09:30", "data5": "Duration 1h 30m"},
    {"image": "assets/images/search_two.png", "data1": "Pennsylvania R...", "data2": "34.00", "data3": "09:00", "data4": "10:45", "data5": "Duration 1h 45m"},
    {"image": "assets/images/search_three.png", "data1": "Kansas City So...", "data2": "42.00", "data3": "10:00", "data4": "11:20", "data5": "Duration 1h 20m"},
    {"image": "assets/images/search_one.jpeg", "data1": "Amtrak", "data2": "40.00", "data3": "11:00", "data4": "12:30", "data5": "Duration 1h 30m"},
    {"image": "assets/images/search_five.png", "data1": "MTA NYC", "data2": "38.00", "data3": "12:00", "data4": "13:40", "data5": "Duration 1h 40m"}
  ].obs;

  static RxList sortfilter = ["Default", "Lowest Price", "Highest Price", "Shortest Duration", "Longest Duration"].obs;
  static RxList sortfilterOne = ["Show All Ticket", "Show Available Ticket", "Show Unavailable Ticket"].obs;
  static RxList sortfilterTwo = ["All Class", "Executive", "Business", "Economy"].obs;
  static RxList idtype = ["ID Card"].obs;
  static RxList passengertype = ["Adult(General)"].obs;
  static RxList<Map<String, dynamic>> sortfilterThree = [
    {"image": "assets/images/ball.png", "data1": "Alaska Railroad", "data2": false},
    {"image": "assets/images/search_one.jpeg", "data1": "Amtrak", "data2": false},
    {"image": "assets/images/sortfilterfour.png", "data1": "Chicago and North Western...", "data2": false},
    {"image": "assets/images/search_three.png", "data1": "Kansas City Southern Railway", "data2": false},
    {"image": "assets/images/sortfilter_two.jpeg", "data1": "Milwaukee Road", "data2": false},
    {"image": "assets/images/search_five.png", "data1": "MTA NYC", "data2": false},
    {"image": "assets/images/sortfilter_three.png", "data1": "New Haven McGinnis", "data2": false},
    {"image": "assets/images/sortfilterfour.png", "data1": "New York Central Railroad", "data2": false},
    {"image": "assets/images/sort_filter_six.jpeg", "data1": "Pacific Electric Railway", "data2": false},
    {"image": "assets/images/search_two.png", "data1": "Pennsylvania Railroad", "data2": false},
    {"image": "assets/images/sort_filter_seven.png", "data1": "Tri-Rail", "data2": false},
    {"image": "assets/images/search_five.png", "data1": "Union Pacific Railroad", "data2": false},
    {"image": "assets/images/sortfilter_two.jpeg", "data1": "Western Pacific", "data2": false},
    {"image": "assets/images/milvauke.png", "data1": "Wisconsin and Southern Rail...", "data2": false},
  ].obs;

  static RxList<Map<String, dynamic>> payment = [
    {"image": AppImages.wallet, "dataOne": "My Wallet"},
    {"image": AppImages.paypal, "dataOne": "Paypal"},
    {"image": AppImages.google, "dataOne": "Google Pay"},
    {"image": AppImages.apple, "dataOne": "Apple Pay"},
    {"image": AppImages.visa, "dataOne": ".... .... .... 5567"},
  ].obs;

  static RxList<Map<String, dynamic>> account = [
    {"image": Icons.person, "dataOne": AppString.personal},
    {"image": Icons.people, "dataOne": AppString.passengerlist},
    {"image": Icons.payment, "dataOne": AppString.paymentmethod},
    {"image": Icons.notifications_active_outlined, "dataOne": AppString.notification},
    {"image": Icons.security_outlined, "dataOne": AppString.security},
    {"image": Icons.language, "dataOne": AppString.language},
    {"image": Icons.remove_red_eye_outlined, "dataOne": AppString.darkmode},
  ].obs;

  static RxList<Map<String, dynamic>> accounttwo = [
    {"image": Icons.help_center_outlined, "dataOne": AppString.helpcenter},
    {"image": Icons.lock_outline, "dataOne": AppString.privacypolicy},
    {"image": Icons.info_outline_rounded, "dataOne": AppString.aboutrailify},
    {"image": Icons.login, "dataOne": AppString.logout},
  ].obs;

  static RxList seat = ["A1", "B1", "1", "C1", "D1", "A2", "B2", "2", "C2", "D2", "A3", "B3", "3", "C3", "D3", "A4", "B4", "4", "C4", "D4", "A5", "B5", "5", "C5", "D5", "A6", "B6", "6", "C6", "D6", "A7", "B7", "7", "C7", "D7"].obs;

  static RxList passengerList = ["Jenny Wilson", "Ronald Richards", "Eleanor Pena", "Jacob Jones", "Savannah Nguyen", "Kristin Watson", "Albert Flores", "Jane Cooper", "Jane Cooper", "Courtney Henry"].obs;
}
