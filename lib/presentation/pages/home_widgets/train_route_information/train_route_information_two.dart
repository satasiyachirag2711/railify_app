import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';

class TrainRouteInformationTwo extends StatefulWidget {
  final String title;
  final String image;
  final String appbar;
  const TrainRouteInformationTwo({super.key, required this.title, required this.image, required this.appbar});

  @override
  State<TrainRouteInformationTwo> createState() => _TrainRouteInformationTwoState();
}

class _TrainRouteInformationTwoState extends State<TrainRouteInformationTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appbar),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                height: Get.height * 0.09,
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.asset(widget.image, scale: 5),
                      title: Text(
                        widget.title,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038),
                      ),
                      subtitle: Text(
                        "Normal Trip",
                        style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                height: Get.height * 1.1,
                child: Row(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: index == 0 ? Get.height * 0.14 : Get.height * 0.21, top: 15, right: 15),
                        child: Column(children: [
                          Text("Transit", style: TextStyle(color: AppColor.black54)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: index == 1
                                          ? Colors.purple
                                          : index == 2
                                              ? Colors.yellow
                                              : Colors.red,
                                      borderRadius: BorderRadius.circular(10))),
                              const SizedBox(width: 5),
                              Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: index == 1
                                          ? AppColor.blue
                                          : index == 2
                                              ? Colors.green
                                              : Colors.orange,
                                      borderRadius: BorderRadius.circular(10)))
                            ],
                          ),
                        ]),
                      ),
                    )),
                    Expanded(
                      flex: -2,
                      child: Container(
                        width: 8,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey, width: 1)),
                        child: const RotatedBox(
                          quarterTurns: -1,
                          child: LinearProgressIndicator(value: 1, minHeight: 8),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: AppList.routeline.length,
                          itemBuilder: (context, index) => Wrap(children: [
                            ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              horizontalTitleGap: 0,
                              title: Text(
                                AppList.routeline[index],
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                              leading: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  const Icon(Icons.minimize_outlined),
                                  index == 0 || index == 16
                                      ? IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.location_on_rounded,
                                            color: AppColor.blue,
                                          ),
                                        )
                                      : Radio(
                                          value: 1,
                                          activeColor: index == 3 || index == 7 || index == 11 ? AppColor.blue : Colors.grey,
                                          groupValue: 1,
                                          onChanged: (value) {},
                                        ),
                                ],
                              ),
                            ),
                          ]),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
