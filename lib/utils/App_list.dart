import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/utils/app_images.dart';
import 'package:railify_app/utils/app_string.dart';

class AppList {
  static RxList<int> topup = [10, 20, 50, 100, 200, 250, 500, 700, 1000].obs;
  static RxList<String> origin = ["Apex Square", "Aurora Point", "Cosmos Junction", "Equinox Depot", "Epicenter Station", "Future Oasis Station", "Fusion Heights", "Fusion Square", "Fusion Station"].obs;
  static RxList<String> desti = ["Epicenter Station", "Future Oasis Station", "Fusion Station", "Luminous Station", "Proxima Station", "Skylight Station", "Solaris Station", "South Station", "Stellar Station"].obs;
  static RxList<String> alarm = [
    "Alert me 5 km before-reaching",
    "Alert me 10 km before-reaching",
    "Alert me 15 km before-reaching",
    "Alert me 20 km before-reaching",
    "Alert me 25 km beforereaching",
    "Alert me 35 km beforereaching",
    "Alert me 40 km beforereaching",
    "Alert me 45 km beforereaching",
    "Alert me 50 km beforereaching",
    "Alert me 55 km beforereaching",
    "Alert me 60 km beforereaching",
    "Alert me 65 km beforereaching",
    "Alert me 70 km beforereaching",
    "Alert me 75 km beforereaching",
    "Alert me 80 km beforereaching",
    "Alert me 85 km beforereaching",
    "Alert me 90 km beforereaching",
    "Alert me 95 km beforereaching",
    "Alert me 100 km beforereaching"
  ].obs;

  static List<String> shipping = [
    'New York (2548)',
    'Chicago (1957)',
    'Philadephia (2832)',
    'San Antonio (1644)',
    'San Diego (2075)',
    'Los Angeles (2396)',
    'New Orieans (2286)',
    'Houstan (1907)',
  ];
  static List<String> subtitle = [
    '2464 Royal Ln. Mesa, 45463',
    '4140 Parker Rd. Allentown, 31134',
    '2118 Thornridge Cir. Syracuse, 35624',
    '4517 Washington Ave. Manchester, 39495',
    '3517 W. Gray St. Utica, 57867',
    '3891 Ranchview Dr. Richardson, 62639',
    '1901 Thornridge Cir. Shiloh, 81063',
    '1595 washington Cir,Allentown 45677',
  ];

  static RxList<String> gender = ["Male", "Female"].obs;

  static RxList<String> train = ["All Class", "Executive", "Business", "Economy"].obs;
  static RxList<String> passenger = ["0 Adult", "1 Adult", "2 Adult", "3 Adult", "4 Adult", "5 Adult"].obs;

  static RxList<Map<String, dynamic>> checkBooking = [
    {"image": AppImages.ticket, "data": "Check Booking"},
    {"image": AppImages.calender, "data": "Re- Schedule"},
    {"image": AppImages.calenderone, "data": "Train Cancellation"},
    {"image": AppImages.cutlery, "data": "Order Train Food"},
    {"image": AppImages.seat, "data": "Check Seat Availability"},
    {"image": AppImages.train, "data": "Train Live Status"},
    {"image": AppImages.calendertwo, "data": "Train Schedule"},
    {"image": AppImages.letter, "data": "Train Line Information"},
    {"image": AppImages.doller, "data": "Train Fare"},
    {"image": AppImages.refund, "data": "Refund Calculation"},
    {"image": AppImages.clock, "data": "Station Alarm"},
    {"image": AppImages.cube, "data": "Shipping Rates"}
  ].obs;

  static RxList<Map<String, dynamic>> notification = [
    {"image": AppImages.notithree, "dataOne": AppString.security, "datatwo": AppString.today, "datathree": AppString.nowrailify},
    {"image": AppImages.notitwo, "dataOne": AppString.multiple, "datatwo": AppString.day1, "datathree": AppString.nowyou},
    {"image": AppImages.notione, "dataOne": AppString.newupdate, "datatwo": AppString.days2, "datathree": AppString.updaterailify},
    {"image": AppImages.notitwo, "dataOne": AppString.creditcard, "datatwo": AppString.days3, "datathree": AppString.yourcredit},
    {"image": AppImages.user, "dataOne": AppString.account, "datatwo": AppString.dec, "datathree": AppString.youraccount},
  ].obs;

  static RxList sortfilter = ["Default", "Lowest Price", "Highest Price", "Shortest Duration", "Longest Duration"].obs;
  static RxList sortfilterOne = ["Show All Ticket", "Show Available Ticket", "Show Unavailable Ticket"].obs;
  static RxList sortfilterTwo = ["All Class", "Executive", "Business", "Economy"].obs;
  static RxList<String> idtype = ["ID Card"].obs;
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

  static RxList<Map<String, dynamic>> paymentmethod = [
    {"image": AppImages.paypal, "dataOne": "Paypal"},
    {"image": AppImages.google, "dataOne": "Google Pay"},
    {"image": AppImages.apple, "dataOne": "Apple Pay"},
    {"image": AppImages.visa, "dataOne": ".... .... .... 5567"},
  ].obs;

  static RxList<Map<String, dynamic>> recenttransaction = [
    {"data": "Order Train Food", "dataone": "22 Dec, 2023. 09:41", "dattwo": "- \$20.00"},
    {"data": "Round Trip Ticket", "dataone": "22 Dec, 2023. 09:39", "dattwo": "- \$72.25"},
    {"data": "Apex Sq... - Proxima", "dataone": "22 Dec, 2023 09:36", "dattwo": "- \$100.50"},
    {"data": "Apex Sq... - Proxima", "dataone": "22 Dec, 2023 09:32", "dattwo": "- \$42.00"},
    {"data": "Top Up Wallet", "dataone": "08 Dec, 2023 - 09:30", "dattwo": "+ \$125.00"},
    {"data": "Aurora Po... Neo De...", "dataone": "07 Dec, 2023 14:45", "dattwo": "- \$75.50"},
    {"data": "Nexus Sq... - Fusion ...", "dataone": "05 Dec, 2023 10:28", "dattwo": "- \$50.00"},
    {"data": "Top Up Wallet", "dataone": "04 Dec, 2023 08:30", "dattwo": "+ \$200.00"},
    {"data": "Round Trip Ticket", "dataone": "03 Dec, 2023. 15:42", "dattwo": "- \$85.00"},
    {"data": "Apex Sa... - Proxima", "dataone": "22 Dec, 2023 09:32", "dattwo": "- \$42.00"},
    {"data": "Round Trip Ticket", "dataone": "24 Dec, 2023. 09:39", "dattwo": "- \$72.25"},
    {"data": "Apex Sq... - Proxima", "dataone": "20 Dec, 2023 09:36", "dattwo": "- \$100.50"},
    {"data": "Apex Sq... - Proxima", "dataone": "10 Dec, 2023 09:32", "dattwo": "- \$42.00"},
    {"data": "Top Up Wallet", "dataone": "08 Dec, 2023 - 09:30", "dattwo": "+ \$125.00"},
    {"data": "Aurora Po... Neo De...", "dataone": "05 Dec, 2023 14:45", "dattwo": "- \$75.50"},
    {"data": "Nexus Sq... - Fusion ...", "dataone": "02 Dec, 2023 10:28", "dattwo": "- \$50.00"},
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

  static RxList<Map<String, dynamic>> helpCenter = [
    {"image": AppImages.customer, "dataOne": AppString.customerservice},
    {"image": AppImages.whatsapp, "dataOne": AppString.whatsapp},
    {"image": AppImages.instagram, "dataOne": AppString.instagram},
    {"image": AppImages.facebook, "dataOne": AppString.facebook},
    {"image": AppImages.twitter, "dataOne": AppString.twitter},
    {"image": AppImages.world, "dataOne": AppString.website},
  ].obs;

  static RxList<Map<String, dynamic>> trainlivestatus = [
    {"dataone": "APS\n0 km", "datatwo": "Apex Square", "datathree": "-", "datafour": "08:00", "datafive": "on time"},
    {"dataone": "AUP\n25 km", "datatwo": "Aurora Point", "datathree": "08:07", "datafour": "08:08", "datafive": "on time"},
    {"dataone": "COJ\n52 km", "datatwo": "Cosmos Junction", "datathree": "08:14", "datafour": "08:15", "datafive": "1Min Late"},
    {"dataone": "EQD\n78 km", "datatwo": "Equinox Depot", "datathree": "08:22", "datafour": "08:23", "datafive": "on time"},
    {"dataone": "EPS\n104 km", "datatwo": "Epicenter Station", "datathree": "08:30", "datafour": "08:31", "datafive": "on time"},
    {"dataone": "FOS\n133 km", "datatwo": "Future Oasis Station", "datathree": "08:37", "datafour": "08:38", "datafive": "waiting"},
    {"dataone": "FUH\n152 km", "datatwo": "Fusion Heights", "datathree": "08:44", "datafour": "08:45", "datafive": "waiting"},
    {"dataone": "HHS\n176 km", "datatwo": "Horizon Heights Station", "datathree": "08:53", "datafour": "08:54", "datafive": "waiting"},
    {"dataone": "HYJ\n201 km", "datatwo": "Hyperion Junction", "datathree": "09:04", "datafour": "09:05", "datafive": "waiting"},
    {"dataone": "INS\n228 km", "datatwo": "Infinity Square", "datathree": "09:14", "datafour": "09:15", "datafive": "waiting"},
    {"dataone": "MEJ\n257 km", "datatwo": "Metropolitan Junction", "datathree": "09:23", "datafour": "09:24", "datafive": "waiting"},
    {"dataone": "PRS\n274 km", "datatwo": "Proxima Station", "datathree": "09:30", "datafour": "09:31", "datafive": "waiting"},
    {"dataone": "SKS\n305 km", "datatwo": "Skylight Station", "datathree": "09:37", "datafour": "09:38", "datafive": "waiting"},
    {"dataone": "SOS\n328 km", "datatwo": "Solaris Station", "datathree": "09:44", "datafour": "09:45", "datafive": "waiting"},
  ].obs;

  static RxList<String> trainschedule = ["Apex Square", "Aurora Point", "Cosmos Junction", "Equinox Depot", " Epicenter Station", " Future Oasis Station", "Fusion Heights", "Horizon Heights Station", "Hyperion Junction", "Infinity Square", "Metropolitan Junction", "Proxima Station", "Skylight Station", "Solaris Station"].obs;

  static RxList<Map<String, dynamic>> food = [
    {"image": AppImages.foodone, "dataOne": "Special Burger with Extra Cheese", "dataTwo": "10.00"},
    {"image": AppImages.foodtwo, "dataOne": "Special Original Italian Pizza", "dataTwo": "9.00"},
    {"image": AppImages.foodthree, "dataOne": "Assorted Vegetable Sandwiches", "dataTwo": "6.00"},
    {"image": AppImages.foodfour, "dataOne": "Vegetable, Fruit and Seafood Salad", "dataTwo": "8.00"},
    {"image": AppImages.foodfive, "dataOne": "Original Croissants for Breakfast", "dataTwo": "8.00"},
    {"image": AppImages.foodsix, "dataOne": "Cappuccino Coffee with Milk", "dataTwo": "4.00"},
    {"image": AppImages.foodseven, "dataOne": "Hot Fresh Tea", "dataTwo": "3.00"},
    {"image": AppImages.foodeight, "dataOne": "Special Orange Juice", "dataTwo": "5.00"},
    {"image": AppImages.foodnine, "dataOne": "Beer with Extra Cup Size", "dataTwo": "6.00"},
    {"image": AppImages.foodten, "dataOne": "Original Sodas", "dataTwo": "4.00"},
  ].obs;

  static RxList seat = ["A1", "B1", "1", "C1", "D1", "A2", "B2", "2", "C2", "D2", "A3", "B3", "3", "C3", "D3", "A4", "B4", "4", "C4", "D4", "A5", "B5", "5", "C5", "D5", "A6", "B6", "6", "C6", "D6", "A7", "B7", "7", "C7", "D7"].obs;

  static RxList passengerList = ["Jenny Wilson", "Ronald Richards", "Eleanor Pena", "Jacob Jones", "Savannah Nguyen", "Kristin Watson", "Albert Flores", "Jane Cooper", "Jane Cooper", "Courtney Henry"].obs;
  static RxList notifications = ["Notify me when...", "I made a train ticket order", "I made a payment", "I canceled my train trip order", "There are special offers/discounts", "There is new news", "System", "App System", "Guidance, tips, and tricks", "Participate in a survey"].obs;
  static RxList security = ["Remember me", "Biometric", "Face ID", "SMS Authenticator", "Google Authenticator", "Device Management"].obs;
  static RxList language = ["Suggested", "English (US)", "English (UK)", "Language", "Mandarin", "Spanish", "French", "Arabic", "Bengalix", "Russian", "Japanese", "Korean", "Indonesia", "Gujarati", "Hindi"].obs;
  static RxList canceltrip = ["Sudden change in plans", "Weather conditions", "Health concerns", "Budget constraints", "Budget constraints", "Unforeseen circumstances", "Mechanical issues", "Personal preferences", "Another reason"].obs;
  static RxList foodCancel = ["Change of plans", "Dietary restrictions", "Unappetizing options", "Health concerns", "Unforeseen circumstances", "Environmental factors", "Delayed service", "Personal preferences", "Another reason"].obs;
  static RxList about = [AppString.jobvacancy, AppString.developer, AppString.partner, AppString.accessibility, AppString.termsofuse, AppString.feedback, AppString.rateus, AppString.visitour, AppString.followus].obs;
  static RxList routeline = [
    "Atlas Square",
    "Brightscape Station",
    "Chromatic Heights",
    "Cosmic Station",
    "Dreamhaven Depot",
    "Elysium Junction",
    "Elysium Junction",
    "Eventide Depot",
    "Galactic Square",
    "Halcyon Station",
    "Helix Junction",
    "Hypernova Station",
    "Illuminata Square",
    "Infinity Heights",
    "Kinetic Station",
    "Luminary Depot",
    "Metropolis Square",
  ].obs;
}
