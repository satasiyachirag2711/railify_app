import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/presentation/widgets/custom_train.dart';

import '../../../controller/globle_controller.dart';
import '../../../utils/app_color.dart';

class TicketsComplectedScreen extends StatefulWidget {
  const TicketsComplectedScreen({super.key});

  @override
  State<TicketsComplectedScreen> createState() => _TicketsComplectedScreenState();
}

class _TicketsComplectedScreenState extends State<TicketsComplectedScreen> {
  GlobleController global = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: Get.height,
          child: ListView.builder(
            itemCount: global.data.length,
            itemBuilder: (context, index) => Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                  height: Get.height * 0.2,
                  child: CustomTrain(index: index, tr: 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
