import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:railify_app/presentation/pages/home_widgets/train_schedule/train_schedule_two_screen.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_dropdownbutton.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';

import '../../../../controller/globle_controller.dart';
import '../../../../utils/App_list.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_textfield.dart';

class TrainscheduleScreen extends StatefulWidget {
  final String title;
  const TrainscheduleScreen({super.key, required this.title});

  @override
  State<TrainscheduleScreen> createState() => _TrainscheduleScreenState();
}

class _TrainscheduleScreenState extends State<TrainscheduleScreen> {
  GlobleController globle = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomDropDown(
                hint: AppString.selectdeparture,
                value: globle.shedule,
                items: AppList.trainschedule.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    globle.shedule = value;
                  });
                }),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextFild(
                    controller: globle.starttime,
                    Icons: IconButton(
                        onPressed: () async {
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (picked != null) {
                            setState(() {
                              globle.starttime.text = picked.format(context);
                            });
                          }
                        },
                        icon: const Icon(Icons.access_time)),
                    hint: AppString.starttime,
                    leble: AppString.starttime,
                  ),
                ),
                SizedBox(width: Get.width * 0.04),
                Expanded(
                  child: Expanded(
                    child: CustomTextFild(
                      controller: globle.endtime,
                      Icons: IconButton(
                          onPressed: () async {
                            final TimeOfDay? picked = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (picked != null) {
                              setState(() {
                                globle.endtime.text = picked.format(context);
                              });
                            }
                          },
                          icon: const Icon(Icons.access_time)),
                      hint: AppString.endtime,
                      leble: AppString.endtime,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomBtn(
              onPressed: () {
                if (globle.starttime.text.isNotEmpty && globle.endtime.text.isNotEmpty) {
                  Get.to(TrainScheduleTwo(title: widget.title, select: globle.shedule, starttime: globle.starttime.text, endtime: globle.endtime.text));
                  globle.starttime.clear();
                  globle.endtime.clear();
                }
              },
              text: AppString.checktrain),
        ),
      ),
    );
  }
}
