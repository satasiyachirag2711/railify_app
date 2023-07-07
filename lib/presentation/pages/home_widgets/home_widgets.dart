import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/one_way/one_way_custom.dart';
import 'package:railify_app/presentation/pages/notification_screen.dart';
import 'package:railify_app/utils/app_images.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../utils/App_list.dart';
import '../../../utils/app_color.dart';

class HomeWigets extends StatefulWidget {
  const HomeWigets({super.key});

  @override
  State<HomeWigets> createState() => _HomeWigetsState();
}

class _HomeWigetsState extends State<HomeWigets> {
  GlobleController globle = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: Get.width * 0.03, top: Get.height * 0.07),
                height: Get.height * 0.45,
                color: AppColor.blue,
                child: ListTile(
                  leading: Image.asset(AppImages.dp, scale: 0.8),
                  title: Text(AppString.goodmoarnig, style: TextStyle(color: Colors.white70, fontSize: Get.width * 0.032)),
                  subtitle: Text(
                    AppString.andrew,
                    style: TextStyle(color: AppColor.white, fontSize: Get.width * 0.04, height: 1.5, fontWeight: FontWeight.bold),
                  ),
                  trailing: GestureDetector(
                    onTap: () => Get.to(const NotificationScreen()),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Get.width), border: Border.all(color: AppColor.white)),
                      child: Stack(
                        alignment: const Alignment(0.5, -0.3),
                        children: [
                          Icon(
                            Icons.notifications_sharp,
                            color: AppColor.white,
                            size: Get.width * 0.07,
                          ),
                          Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: Get.height * 0.6,
                      padding: EdgeInsets.all(Get.width * 0.06),
                      margin: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05, top: Get.height * 0.18),
                      decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(Get.width * 0.04)),
                      child: DefaultTabController(
                        length: 2,
                        child: Column(
                          children: [
                            TabBar(
                              indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(width: 4.0, color: AppColor.blue),
                              ),
                              unselectedLabelColor: Colors.black45,
                              labelColor: AppColor.blue,
                              labelStyle: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.w500),
                              tabs: [
                                Tab(
                                  text: AppString.oneway,
                                ),
                                Tab(text: AppString.round)
                              ],
                            ),
                            const Expanded(
                              child: TabBarView(
                                children: [
                                  // First Tab View
                                  OneWayCustom(),
                                  // Second Tab View
                                  Center(
                                    child: Text("Round Tab View"),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(Get.width * 0.02),
                      margin: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05, top: Get.height * 0.03),
                      decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(Get.width * 0.04)),
                      height: Get.height * 0.48,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: AppList.checkBooking.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: Get.height * 0.13,
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) => Column(
                          children: [
                            Container(
                              height: 50,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(Get.width), color: Colors.grey.shade100),
                              child: index == 7
                                  ? Center(
                                      child: Container(
                                      height: 30,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: AppColor.blue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "i",
                                          style: TextStyle(color: AppColor.white, fontSize: Get.width * 0.04, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ))
                                  : Image.asset(
                                      AppList.checkBooking[index]["image"],
                                      color: AppColor.blue,
                                      scale: 17,
                                    ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              AppList.checkBooking[index]["data"],
                              style: TextStyle(fontSize: Get.width * 0.028, height: 1.4),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppString.special,
                            style: TextStyle(color: AppColor.black, fontSize: Get.width * 0.05, height: 1.8, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_rounded, color: AppColor.blue, size: Get.width * 0.07),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.42,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(Get.width * 0.06)),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(index == 0
                                            ? AppImages.disone
                                            : index == 1
                                                ? AppImages.distwo
                                                : AppImages.disthree),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(Get.width * 0.08),
                                    ),
                                  ),
                                  height: Get.height * 0.25,
                                  width: Get.width * 0.8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, top: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        AppString.get25off,
                                        style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: Get.width * 0.04,
                                          height: 1.6,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: Get.width * 0.05),
                                      Icon(Icons.keyboard_arrow_right, color: AppColor.blue),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    AppString.limited,
                                    style: TextStyle(
                                      color: AppColor.black54,
                                      fontSize: Get.width * 0.032,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppString.ournewsstori,
                            style: TextStyle(color: AppColor.black, fontSize: Get.width * 0.05, height: 1.8, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_rounded, color: AppColor.blue, size: Get.width * 0.07),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: Get.height * 0.1),
                      height: Get.height * 0.42,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(Get.width * 0.08)),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage(index == 0 ? AppImages.homeone : AppImages.hometwo), fit: BoxFit.cover),
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(Get.width * 0.08),
                                    ),
                                  ),
                                  height: Get.height * 0.25,
                                  width: Get.width * 0.8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, top: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        AppString.trainapp,
                                        style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: Get.width * 0.04,
                                          height: 1.6,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: Get.width * 0.05),
                                      Icon(Icons.keyboard_arrow_right, color: AppColor.blue),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    index == 0 ? AppString.hours : AppString.day,
                                    style: TextStyle(
                                      color: AppColor.black54,
                                      fontSize: Get.width * 0.032,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
