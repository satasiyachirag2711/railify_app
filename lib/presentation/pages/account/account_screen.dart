import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/account/about_screen.dart';
import 'package:railify_app/presentation/pages/account/general_screen.dart';
import 'package:railify_app/presentation/pages/one_boarder_screen.dart';
import 'package:railify_app/utils/App_list.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_images.dart';
import 'package:railify_app/utils/app_string.dart';
import 'package:share_plus/share_plus.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  GlobleController global = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.ac, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: Icon(Icons.directions_train_outlined, color: AppColor.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Image.asset(AppImages.dp, scale: 0.8),
                title: Text(AppString.andrew, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04)),
                subtitle: Text(
                  "andrewainsley@yourdomain.com",
                  style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.03, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => Container(
                        decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.vertical(top: Radius.circular(Get.width * 0.1))),
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(AppString.myqrcode, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04)),
                              Image.asset(AppImages.qrcode, scale: 1.8),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    padding: const MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(vertical: 14),
                                    ),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        side: BorderSide(color: AppColor.blue),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                                    elevation: const MaterialStatePropertyAll(0),
                                  ),
                                  onPressed: () async {
                                    await Share.share('Check out My QR Code:\n ${AppImages.qrcode}');
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.share,
                                        color: AppColor.blue,
                                      ),
                                      Text(
                                        AppString.share,
                                        style: TextStyle(
                                          color: AppColor.blue,
                                        ),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.qr_code,
                    color: AppColor.blue,
                    size: Get.width * 0.08,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    AppString.general,
                    style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.032, fontWeight: FontWeight.bold),
                  ),
                  const Expanded(child: Divider())
                ],
              ),
              SizedBox(
                height: Get.height * 0.45,
                child: ListView.builder(
                  itemCount: AppList.account.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: Icon(AppList.account[index]["image"]),
                    title: Text(AppList.account[index]["dataOne"], style: const TextStyle(fontWeight: FontWeight.bold)),
                    trailing: index == 5
                        ? Wrap(
                            children: [
                              Text(AppString.english, style: const TextStyle(fontWeight: FontWeight.w500)),
                              Icon(Icons.arrow_forward_ios_rounded, size: Get.width * 0.05),
                            ],
                          )
                        : index == 6
                            ? Obx(() {
                                return Switch(
                                  value: global.unselect.value,
                                  onChanged: (value) {
                                    global.unselect.value = !global.unselect.value;
                                  },
                                );
                              })
                            : Icon(Icons.arrow_forward_ios_rounded, size: Get.width * 0.05),
                    onTap: () {
                      if (index == 6) {
                        return null;
                      } else {
                        Get.to(GeneralScreen(name: AppList.account[index]["dataOne"]));
                      }
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    AppString.about,
                    style: TextStyle(color: AppColor.black54, fontSize: Get.width * 0.032, fontWeight: FontWeight.bold),
                  ),
                  const Expanded(child: Divider())
                ],
              ),
              SizedBox(
                height: Get.height * 0.24,
                child: ListView.builder(
                  itemCount: AppList.accounttwo.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: Icon(AppList.accounttwo[index]["image"], color: index == 3 ? Colors.red : AppColor.black),
                    title: Text(AppList.accounttwo[index]["dataOne"], style: TextStyle(color: index == 3 ? Colors.red : AppColor.black, fontWeight: FontWeight.bold)),
                    trailing: index == 3 ? const SizedBox() : Icon(Icons.arrow_forward_ios_rounded, size: Get.width * 0.05),
                    onTap: () {
                      if (index == 3) {
                        showModalBottomSheet(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => Container(
                                height: Get.height * 0.3,
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(Get.width * 0.1)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                                    Text(
                                      AppString.logout,
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: Get.width * 0.045),
                                    ),
                                    const Divider(),
                                    Text(
                                      AppString.areyousure,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04),
                                    ),
                                    Row(children: [
                                      Expanded(
                                          child: ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                                            backgroundColor: MaterialStatePropertyAll(Colors.blue.shade50),
                                            minimumSize: MaterialStatePropertyAll(
                                              Size(Get.width, Get.height * 0.06),
                                            )),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(AppString.cancel),
                                      )),
                                      const SizedBox(width: 25),
                                      Expanded(
                                          child: ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                                            minimumSize: MaterialStatePropertyAll(
                                              Size(Get.width, Get.height * 0.06),
                                            )),
                                        onPressed: () {
                                          Get.off(const OneBoarderScreen());
                                        },
                                        child: Text(AppString.yeslogout),
                                      ))
                                    ])
                                  ]),
                                )));
                      } else {
                        Get.to(AboutScreen(
                          name: AppList.accounttwo[index]["dataOne"],
                        ));
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
