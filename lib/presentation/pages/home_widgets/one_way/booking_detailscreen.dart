import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/widgets/custom_textfield.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_images.dart';

class BookingDetailScreen extends StatefulWidget {
  final String image;
  final String title;
  final String trailing;
  final String date;
  final String leading;
  final String trailingtwo;
  final String subtitle;
  const BookingDetailScreen({super.key, required this.image, required this.title, required this.subtitle, required this.trailing, required this.leading, required this.trailingtwo, required this.date});

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  GlobleController global = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.bookingdetail,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.tripdetail,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.045),
              ),
              Container(
                decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                height: Get.height * 0.22,
                margin: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.asset(widget.image, scale: 5),
                      title: Text(
                        widget.title,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038),
                      ),
                      subtitle: Text(
                        "Economy",
                        style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                      ),
                      trailing: Wrap(
                        children: [
                          Text(
                            "Available",
                            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: Get.width * 0.028),
                          ),
                          SizedBox(width: Get.width * 0.04),
                          Text(
                            widget.trailing,
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppString.apex,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                              child: Text(
                                widget.leading,
                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                              ),
                            ),
                            Text(
                              widget.date,
                              style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(AppImages.searchicon, scale: 12),
                            Text(
                              widget.subtitle,
                              style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              AppString.proxima,
                              style: TextStyle(fontSize: Get.width * 0.034),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                              child: Text(
                                widget.trailingtwo,
                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                              ),
                            ),
                            Text(
                              widget.date,
                              style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.contackdetail,
                    style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.edit,
                    color: AppColor.blue,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
                height: Get.height * 0.35,
                width: Get.width,
                margin: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFild(
                      hint: "Name",
                      controller: global.fullName,
                      leble: AppString.fullname,
                      icon: Icon(Icons.person),
                    ),
                    CustomTextFild(
                      hint: AppString.email,
                      controller: global.email,
                      leble: AppString.email,
                      Icons: IconButton(onPressed: () {}, icon: Icon(Icons.email_outlined)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
