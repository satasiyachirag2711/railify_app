import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../utils/App_list.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_images.dart';

class ResentTransationScreen extends StatefulWidget {
  const ResentTransationScreen({super.key});

  @override
  State<ResentTransationScreen> createState() => _ResentTransationScreenState();
}

class _ResentTransationScreenState extends State<ResentTransationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.recenttransation),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 3),
            itemCount: AppList.recenttransaction.length,
            itemBuilder: (context, index) => ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: index == 0 ? Image.asset(AppImages.cutlery, scale: 20, color: AppColor.blue) : Icon(index == 4 || index == 7 || index == 13 ? Icons.keyboard_double_arrow_down : Icons.train, color: AppColor.blue),
                  title: Text(AppList.recenttransaction[index]["data"], style: TextStyle(fontWeight: FontWeight.w600, fontSize: Get.width * 0.038)),
                  subtitle: Text(AppList.recenttransaction[index]["dataone"], style: TextStyle(height: 1.5, fontSize: Get.width * 0.03)),
                  trailing: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        AppList.recenttransaction[index]["dattwo"],
                        style: TextStyle(color: index == 4 || index == 7 || index == 13 ? AppColor.blue : Colors.red.shade500, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios, size: Get.width * 0.05)
                    ],
                  ),
                )),
      ),
    );
  }
}
