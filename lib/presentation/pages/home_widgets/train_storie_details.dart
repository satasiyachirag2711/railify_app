import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_string.dart';
import 'package:share_plus/share_plus.dart';

class TrainStoriesDetails extends StatefulWidget {
  final String image;
  final String name;
  final String hour;
  const TrainStoriesDetails({super.key, required this.image, required this.name, required this.hour});

  @override
  State<TrainStoriesDetails> createState() => _TrainStoriesDetailsState();
}

class _TrainStoriesDetailsState extends State<TrainStoriesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await Share.share('Check out this train story:\n ${widget.name} \n- ${widget.hour}\n-${widget.image}');
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.image), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(Get.width * 0.08),
                ),
                height: Get.height * 0.3,
                width: Get.width,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(widget.name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.04)),
              ),
              Text(widget.hour, style: TextStyle(color: AppColor.black54)),
              const SizedBox(height: 10),
              Text(AppString.forasuccessfull, style: TextStyle(color: AppColor.black54))
            ],
          ),
        ),
      ),
    );
  }
}
