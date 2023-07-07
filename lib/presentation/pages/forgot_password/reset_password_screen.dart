import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/forgot_password/otp_code_screen.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/presentation/widgets/custom_textfield.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_string.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  GlobleController globle = Get.find();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05, vertical: Get.height * 0.04),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.resetpassword,
                      style: TextStyle(fontSize: Get.width * 0.06, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                      child: Text(
                        AppString.pleaseenteryour,
                        style: TextStyle(fontSize: Get.width * 0.032, height: 1.4, color: AppColor.black54),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.025),
                    CustomTextFild(
                      obsertext: false,
                      hint: AppString.email,
                      validator: (value) {
                        if (globle.email.text.isEmpty) {
                          return "Please enter Email";
                        } else if (globle.email.text.isEmail == false) {
                          return "Please verified email";
                        } else {
                          null;
                        }
                      },
                      controller: globle.email,
                      leble: AppString.email,
                      Icons: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.email_outlined,
                          size: 30,
                          color: AppColor.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomBtn(
                text: AppString.conti,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Get.to(OtpCodeScreen(
                      email: globle.email.text.toString(),
                    ));
                    globle.email.clear();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
