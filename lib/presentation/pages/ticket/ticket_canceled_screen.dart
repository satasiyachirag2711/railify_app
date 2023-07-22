import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/presentation/widgets/custom_train.dart';

import '../../../controller/globle_controller.dart';
import '../../../utils/App_list.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_string.dart';

class TicketCancelSceen extends StatefulWidget {
  const TicketCancelSceen({super.key});

  @override
  State<TicketCancelSceen> createState() => _TicketCancelSceenState();
}

class _TicketCancelSceenState extends State<TicketCancelSceen> {
  GlobleController global = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.blue),
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: AppColor.blue,
                      ),
                      labelColor: AppColor.white,
                      unselectedLabelColor: AppColor.blue,
                      tabs: const [
                        Tab(
                          text: "Tickets",
                        ),
                        Tab(
                          text: "Services",
                        )
                      ]),
                ),
                Expanded(
                    child: TabBarView(children: [
                  SizedBox(
                    height: Get.height,
                    child: ListView.builder(
                      itemCount: AppList.search.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                            height: Get.height * 0.24,
                            child: CustomTrain(index: index, tr: 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height,
                    child: ListView.builder(
                      itemCount: AppList.search.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                            height: Get.height * 0.3,
                            child: Column(
                              children: [
                                ListTile(
                                    leading: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset(AppList.food[index]["image"], scale: 0.7)),
                                    title: Text(
                                      AppList.food[index]["dataOne"],
                                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038),
                                    ),
                                    trailing: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red.shade400)),
                                      child: Text("Canceled", style: TextStyle(fontSize: Get.width * 0.025)),
                                    )),
                                const Divider(),
                                ListTile(
                                  leading: Image.asset(AppList.search[index]["image"], scale: index == 2 ? 9 : 5),
                                  title: Text(
                                    AppList.search[index]["data1"],
                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038),
                                  ),
                                  subtitle: Text(
                                    AppString.economy,
                                    style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                                  ),
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppString.apex,
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                                          child: Text(
                                            AppList.search[index]["data3"],
                                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                                          ),
                                        ),
                                        Text(
                                          DateFormat('dd MMMM yyyy').format(global.selectedDate),
                                          style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(AppImages.searchicon, scale: 12),
                                        Text(
                                          AppList.search[index]["data5"],
                                          style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          AppString.proxima,
                                          style: TextStyle(fontSize: Get.width * 0.034),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                                          child: Text(
                                            AppList.search[index]["data4"],
                                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                                          ),
                                        ),
                                        Text(
                                          DateFormat('dd MMMM yyyy').format(global.selectedDate),
                                          style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]))
              ],
            ),
          )),
    );
  }
}
