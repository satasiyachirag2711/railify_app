import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/forgot_password/create_new_password.dart';
import 'package:railify_app/presentation/widgets/customNavigatebotam.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_string.dart';

class OtpCodeScreen extends StatefulWidget {
  final String email;
  const OtpCodeScreen({super.key, required this.email});

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  GlobleController globle = Get.find();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08, vertical: Get.height * 0.04),
            child: Column(
              children: [
                Text(
                  AppString.otpcodeverification,
                  style: TextStyle(fontSize: Get.width * 0.06, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                  child: Text(
                    "we have send an otp code your email\n${widget.email}. Enter the otp\ncode below to verify",
                    style: TextStyle(fontSize: Get.width * 0.04, height: 1.4, color: AppColor.black54),
                  ),
                ),
                SizedBox(height: Get.height * 0.07),
                Pinput(
                  controller: globle.pinput,
                  forceErrorState: true,
                  focusedPinTheme: PinTheme(
                    height: Get.height * 0.07,
                    width: Get.width * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColor.blue),
                    ),
                  ),
                  validator: (s) {
                    return null;
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                ),
                Text(
                  AppString.didnot,
                  style: TextStyle(height: 2.5, fontSize: Get.width * 0.038),
                ),
                Text(
                  AppString.youcanresend,
                  style: TextStyle(height: 1.6, fontSize: Get.width * 0.038),
                ),
                SizedBox(height: Get.height * 0.38),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBotamNavigate(
        text: AppString.conti,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            if (globle.pinput.length > 3) {
              globle.password.clear();
              Get.to(
                const CreateNewPassword(),
              );
            }
          }
        },
      ),
    );
  }
}
