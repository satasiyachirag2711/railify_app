import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/presentation/pages/home_widgets/train_route_information/train_route_information_two.dart';

import '../../../../controller/globle_controller.dart';
import '../../../../utils/app_color.dart';

class TrainInformationScreen extends StatefulWidget {
  final String title;
  const TrainInformationScreen({super.key, required this.title});

  @override
  State<TrainInformationScreen> createState() => _TrainInformationScreenState();
}

class _TrainInformationScreenState extends State<TrainInformationScreen> {
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
          child: ListView.separated(
            itemCount: globle.data.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Get.off(TrainRouteInformationTwo(
                  title: globle.data[index].contains('- -') ? globle.data[index].toString().split('- -').last : globle.data[index].toString().split('-').last,
                  image: index % 2 == 0 ? "assets/images/search_two.png" : "assets/images/search_one.jpeg",
                  appbar: widget.title,
                ));
              },
              child: ListTile(
                title: Text(globle.data[index].contains('- -') ? globle.data[index].toString().split('- -').last : globle.data[index].toString().split('-').last, style: const TextStyle(fontWeight: FontWeight.w500)),
                subtitle: Text("Normal Trip", style: TextStyle(fontWeight: FontWeight.w500, color: AppColor.black54)),
                leading: SizedBox(height: 30, width: 50, child: Image.asset(index % 2 == 0 ? "assets/images/search_two.png" : "assets/images/search_one.jpeg")),
                trailing: Icon(Icons.arrow_forward_ios_rounded, size: Get.width * 0.045),
              ),
            ),
          ),
        ));
  }
}
