import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/food/order_food_screen.dart';
import 'package:railify_app/presentation/widgets/custom_train.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';

class SelectTripOrderFood extends StatefulWidget {
  const SelectTripOrderFood({super.key});

  @override
  State<SelectTripOrderFood> createState() => _SelectTripOrderFoodState();
}

class _SelectTripOrderFoodState extends State<SelectTripOrderFood> {
  GlobleController global = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.selecttripfood),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: AppList.search.length,
        itemBuilder: (context, index) => Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(
                  OrderFoodScreen(
                    title: AppList.search[index]["data1"],
                    image: AppList.search[index]["image"],
                    subtitle: AppList.search[index]["data5"],
                    time: AppList.search[index]["data3"],
                    date: DateFormat('dd MMMM yyyy').format(global.selectedDate),
                    timetwo: AppList.search[index]["data4"],
                  ),
                );
              },
              child: Container(margin: const EdgeInsets.all(20), decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)), height: Get.height * 0.2, child: CustomTrain(index: index, tr: 2)),
            ),
          ],
        ),
      ),
    );
  }
}
