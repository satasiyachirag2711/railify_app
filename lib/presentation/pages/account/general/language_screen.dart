import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/utils/App_list.dart';
import 'package:railify_app/utils/app_color.dart';

import '../../../../utils/app_string.dart';

class LangauseScreen extends StatefulWidget {
  const LangauseScreen({Key? key}) : super(key: key);

  @override
  State<LangauseScreen> createState() => _LangauseScreenState();
}

class _LangauseScreenState extends State<LangauseScreen> {
  List<bool> isSelectedList = List<bool>.filled(AppList.language.length, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppString.language,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                isSelectedList[index] = !isSelectedList[index];
              });
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                AppList.language[index],
                style: TextStyle(
                  fontWeight: index == 0 || index == 3 ? FontWeight.bold : FontWeight.w500,
                  height: 2,
                  color: index == 0 || index == 3 ? AppColor.black54 : AppColor.black,
                  fontSize: Get.width * 0.037,
                ),
              ),
              isSelectedList[index] ? const Icon(Icons.check) : const SizedBox(),
            ]),
          ),
          separatorBuilder: (context, index) => index == 2
              ? const Padding(
                  padding: EdgeInsets.all(10),
                  child: Divider(),
                )
              : const SizedBox(
                  height: 20,
                ),
          itemCount: AppList.language.length,
        ),
      ),
    );
  }
}
