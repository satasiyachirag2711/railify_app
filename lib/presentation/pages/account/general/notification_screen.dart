import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/utils/App_list.dart';

import '../../../../utils/app_string.dart';

class NotificationAccount extends StatefulWidget {
  const NotificationAccount({Key? key}) : super(key: key);

  @override
  State<NotificationAccount> createState() => _NotificationAccountState();
}

class _NotificationAccountState extends State<NotificationAccount> {
  RxList<bool> switchValues = List<bool>.generate(AppList.notifications.length, (index) => false).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppString.notification,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemBuilder: (context, index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppList.notifications[index],
                style: TextStyle(
                  fontWeight: index == 0 || index == 6 ? FontWeight.bold : FontWeight.w500,
                  height: 2,
                  fontSize: Get.width * 0.037,
                ),
              ),
              index == 0 || index == 6
                  ? const SizedBox()
                  : Obx(() {
                      return Switch(
                        value: switchValues[index],
                        onChanged: (value) {
                          switchValues[index] = value;
                        },
                      );
                    }),
            ],
          ),
          separatorBuilder: (context, index) => index == 5
              ? const Padding(
                  padding: EdgeInsets.all(10),
                  child: Divider(),
                )
              : const SizedBox(
                  height: 20,
                ),
          itemCount: AppList.notifications.length,
        ),
      ),
    );
  }
}
