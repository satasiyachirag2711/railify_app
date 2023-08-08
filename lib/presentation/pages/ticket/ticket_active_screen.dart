import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/presentation/widgets/custom_train.dart';

import '../../../controller/globle_controller.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_string.dart';

class TicketActiveScreen extends StatefulWidget {
  const TicketActiveScreen({super.key});

  @override
  State<TicketActiveScreen> createState() => _TicketActiveScreenState();
}

class _TicketActiveScreenState extends State<TicketActiveScreen> {
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
                      tabs: [
                        Tab(
                          text: AppString.ti,
                        ),
                        Tab(
                          text: AppString.service,
                        )
                      ]),
                ),
                Expanded(
                    child: TabBarView(children: [
                  SizedBox(
                    height: Get.height,
                    child: ListView.builder(
                      itemCount: global.data.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                            height: Get.height * 0.2,
                            child: CustomTrain(index: index, tr: 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                    height: Get.height * 0.2,
                    child: Column(
                      children: [
                        ListTile(
                            leading: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset(AppImages.pizaa, scale: 0.7)),
                            title: Text(
                              AppString.specialburger,
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038),
                            ),
                            trailing: ElevatedButton(onPressed: () {}, child: const Text("Paid"))),
                        const Divider(),
                        ListTile(
                          leading: Image.asset("assets/images/search_one.jpeg"),
                          title: Text(
                            global.data[0].contains('- -') ? global.data[0].toString().split('- -').last : global.data[0].toString().split('-').last,
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
                                    "10:00",
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
                                  "Duration 1h 30m",
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
                                    "12:00",
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
                        ),
                        const Divider()
                      ],
                    ),
                  ),
                ]))
              ],
            ),
          )),
    );
  }
}
