import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/train_cancellation/cancel_trip_screen.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_train.dart';

class SelectTripScreen extends StatefulWidget {
  const SelectTripScreen({super.key});

  @override
  State<SelectTripScreen> createState() => _SelectTripScreenState();
}

class _SelectTripScreenState extends State<SelectTripScreen> {
  GlobleController global = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.selecttripcancel),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: global.data.length,
        itemBuilder: (context, index) => Column(
          children: [
            GestureDetector(
              onTap: () {
                double randomValue1 = Random().nextDouble() * 12.0;
                double randomValue2 = Random().nextDouble() * 12.0;
                String formattedRandomTime1 = DateFormat('HH:mm').format(DateTime.utc(0, 1, 1).add(Duration(hours: (randomValue1 + 8).toInt(), minutes: ((randomValue1 - (randomValue1 + 8).toInt()) * 60).toInt())));
                String formattedRandomTime2 = DateFormat('HH:mm').format(DateTime.utc(0, 1, 1).add(Duration(hours: (randomValue2 + 8).toInt(), minutes: ((randomValue2 - (randomValue2 + 8).toInt()) * 60).toInt())));

                Get.to(
                  CancelTripScreen(
                    title: global.data[index].contains('- -') ? global.data[index].toString().split('- -').last : global.data[index].toString().split('-').last,
                    image: index % 2 == 0 ? "assets/images/search_one.jpeg" : "assets/images/search_two.png",
                    leading: formattedRandomTime1,
                    date: DateFormat('dd MMMM yyyy').format(global.selectedDate),
                    trailingtwo: formattedRandomTime2,
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                height: Get.height * 0.2,
                child: CustomTrain(index: index, tr: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
