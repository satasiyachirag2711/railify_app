import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/utils/App_list.dart';
import 'package:railify_app/utils/app_color.dart';

import '../../utils/app_string.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  GlobleController globle = Get.put(GlobleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {},
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        title: Text(
          AppString.notification,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.67,
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                  leading: Image.asset(AppList.notification[index]["image"], scale: 20),
                  title: Text(
                    AppList.notification[index]["dataOne"],
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.04),
                  ),
                  trailing: index == 0 || index == 1
                      ? Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(color: AppColor.blue, borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            AppString.ne,
                            style: TextStyle(color: AppColor.white, fontSize: Get.width * 0.025),
                          ))
                      : SizedBox(),
                  contentPadding: EdgeInsets.only(left: 15),
                  subtitle: Text(AppList.notification[index]["datatwo"], style: TextStyle(fontSize: Get.width * 0.03, height: 2)), // Wrap the string in a Text widget
                ),
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: Get.width * 0.04),
                  child: Text(AppList.notification[index]["datathree"], style: TextStyle(fontSize: Get.width * 0.032, color: AppColor.black54)),
                ), // Wrap the string in a Text widget
                itemCount: AppList.notification.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(AppString.youraccount, style: TextStyle(fontSize: Get.width * 0.032, color: AppColor.black54)),
            )
          ],
        ),
      ),
    );
  }
}
