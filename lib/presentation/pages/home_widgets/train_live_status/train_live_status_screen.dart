import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/train_live_status/train_live_status_two_screen.dart';
import 'package:railify_app/presentation/pages/home_widgets/widget/custom_dropdownbutton.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';

import '../../../../utils/app_string.dart';

class TrainLiveStatusScreen extends StatefulWidget {
  final String title;
  const TrainLiveStatusScreen({super.key, required this.title});

  @override
  State<TrainLiveStatusScreen> createState() => _TrainLiveStatusScreenState();
}

class _TrainLiveStatusScreenState extends State<TrainLiveStatusScreen> {
  GlobleController globle = Get.find();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropDown(
                  hint: AppString.train,
                  value: globle.data.first,
                  items: globle.data.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value.contains('- -') ? value.toString().split('- -').last : value.toString().split('-').last),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      globle.statusone = value;
                    });
                  }),
              CustomDropDown(
                  hint: AppString.trainnumber,
                  value: globle.data.first,
                  items: globle.data.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value.toString().split('/').first),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      globle.statustwo = value;
                    });
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: CustomBtn(
              onPressed: () {
                print(globle.statusone.toString());
                if (formKey.currentState!.validate()) {
                  Get.to(TrainLiveStatusTwoScreen(select: globle.statusone.toString(), number: globle.statustwo.toString(), title: widget.title));
                }
              },
              text: AppString.checktrainlive,
            )),
      ),
    );
  }
}
