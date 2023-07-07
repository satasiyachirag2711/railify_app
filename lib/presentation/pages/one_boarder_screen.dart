import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/sign_in_screen.dart';
import 'package:railify_app/presentation/pages/sign_up_screen.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/presentation/widgets/custom_or_continue_with.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../utils/app_color.dart';
import '../../utils/app_images.dart';

class OneBoarderScreen extends StatefulWidget {
  const OneBoarderScreen({super.key});

  @override
  State<OneBoarderScreen> createState() => _OneBoarderScreenState();
}

class _OneBoarderScreenState extends State<OneBoarderScreen> {
  GlobleController globle = Get.put(GlobleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.14),
                Image.asset(
                  AppImages.train_logo,
                  scale: 6,
                ),
                Text(
                  AppString.Railify,
                  style: TextStyle(fontSize: Get.width * 0.07, height: 4, fontWeight: FontWeight.w500),
                ),
                Text(
                  AppString.welcomelets,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: Get.width * 0.036, height: 1.7, fontWeight: FontWeight.w500, color: AppColor.black54),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.06, bottom: Get.height * 0.03),
                  child: CustomBtn(
                    text: AppString.signUP,
                    onPressed: () {
                      Get.to(const SignUpScreen());
                      globle.email.clear();
                      globle.password.clear();
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(const SignInScreen());
                    globle.email.clear();
                    globle.password.clear();
                  },
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Color(0xFFF3F6F6)),
                    minimumSize: MaterialStatePropertyAll(Size(Get.width, Get.height * 0.06)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  child: Text(
                    AppString.SignIn,
                    style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold, color: AppColor.blue),
                  ),
                ),
                CustomContinue(
                  top: Get.height * 0.08,
                  bottom: Get.height * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
