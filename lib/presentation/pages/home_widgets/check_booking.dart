import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';

import '../../../controller/globle_controller.dart';
import '../../widgets/custom_textfield.dart';

class CheckBookScreen extends StatefulWidget {
  final String check;
  const CheckBookScreen({super.key, required this.check});

  @override
  State<CheckBookScreen> createState() => _CheckBookScreenState();
}

class _CheckBookScreenState extends State<CheckBookScreen> {
  GlobleController global = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.check)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextFild(
              hint: "Booking ID",
              controller: global.bookingid,
              leble: "Booking ID",
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: CustomBtn(
            text: "Check",
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
