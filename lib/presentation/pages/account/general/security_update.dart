import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/utils/App_list.dart';

import '../../../../utils/app_string.dart';

class SecurityUpdateScreen extends StatefulWidget {
  const SecurityUpdateScreen({Key? key}) : super(key: key);

  @override
  State<SecurityUpdateScreen> createState() => _SecurityUpdateScreenState();
}

class _SecurityUpdateScreenState extends State<SecurityUpdateScreen> {
  RxList<bool> switchValues = List<bool>.generate(AppList.security.length, (index) => false).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppString.securityes,
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
                AppList.security[index],
                style: TextStyle(
                  fontWeight: index == 0 ? FontWeight.bold : FontWeight.w500,
                  height: 2,
                  fontSize: Get.width * 0.037,
                ),
              ),
              index == 5
                  ? Icon(Icons.arrow_forward_ios)
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
          itemCount: AppList.security.length,
        ),
      ),
    );
  }
}
