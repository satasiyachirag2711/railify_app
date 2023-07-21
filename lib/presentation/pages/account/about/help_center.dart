import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';

class HelpCenter extends StatefulWidget {
  final String name;

  const HelpCenter({super.key, required this.name});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  int selectedContainerIndex = -1;

  GlobleController global = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    text: AppString.faq,
                  ),
                  Tab(text: AppString.contactus)
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // First Tab View
                    Obx(() {
                      return Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.08,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (selectedContainerIndex == index) {
                                      // Unselect the currently selected container
                                      selectedContainerIndex = -1;
                                    } else {
                                      // Select the tapped container
                                      selectedContainerIndex = index;
                                    }
                                  });
                                },
                                child: Container(
                                  width: Get.width * 0.2,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: selectedContainerIndex == index ? AppColor.blue : AppColor.blue,
                                    ),
                                    color: selectedContainerIndex == index ? AppColor.blue : null,
                                  ),
                                  child: Center(
                                    child: Text(
                                      AppString.female,
                                      style: TextStyle(
                                        color: selectedContainerIndex == index ? AppColor.white : AppColor.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                            height: global.help.value == true ? Get.height * 0.18 : Get.height * 0.07,
                            width: Get.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppString.whatisRailify,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          global.help.value = !global.help.value;
                                        },
                                        icon: Icon(global.help.value ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined, color: AppColor.black, size: Get.width * 0.06)),
                                  ],
                                ),
                                global.help.value == true ? const Divider() : const SizedBox(),
                                global.help.value == true
                                    ? Text(
                                        "${AppString.lorem}\nincididunt ut labore et dolore magna aliqua",
                                        style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.036),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                            height: Get.height * 0.07,
                            width: Get.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppString.istherailify,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04),
                                ),
                                Icon(Icons.keyboard_arrow_down_outlined, color: AppColor.black, size: Get.width * 0.06),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                            height: Get.height * 0.07,
                            width: Get.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppString.howcaniorder,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04),
                                ),
                                Icon(Icons.keyboard_arrow_down_outlined, color: AppColor.black, size: Get.width * 0.06),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                            height: Get.height * 0.07,
                            width: Get.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppString.howcan,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04),
                                ),
                                Icon(Icons.keyboard_arrow_down_outlined, color: AppColor.black, size: Get.width * 0.06),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                            height: Get.height * 0.07,
                            width: Get.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppString.howcaniticket,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04),
                                ),
                                Icon(Icons.keyboard_arrow_down_outlined, color: AppColor.black, size: Get.width * 0.06),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                            height: Get.height * 0.07,
                            width: Get.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppString.howcandiscount,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04),
                                ),
                                Icon(Icons.keyboard_arrow_down_outlined, color: AppColor.black, size: Get.width * 0.06),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                    ListView.builder(
                      itemCount: AppList.helpCenter.length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                        height: Get.height * 0.07,
                        width: Get.width,
                        child: ListTile(
                            title: Text(
                              AppList.helpCenter[index]["dataOne"],
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04),
                            ),
                            leading: Image.asset(AppList.helpCenter[index]["image"], scale: 17)),
                      ),
                    ),
                    // Second Tab View
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
