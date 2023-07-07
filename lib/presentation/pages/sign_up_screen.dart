import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_page.dart';
import 'package:railify_app/presentation/pages/sign_in_screen.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/presentation/widgets/custom_or_continue_with.dart';
import 'package:railify_app/presentation/widgets/custom_popup.dart';
import 'package:railify_app/presentation/widgets/custom_textfield.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_string.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobleController globle = Get.find();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05, vertical: Get.height * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.hello,
                  style: TextStyle(fontSize: Get.width * 0.06, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                  child: Text(
                    AppString.pleasenter,
                    style: TextStyle(fontSize: Get.width * 0.04, height: 1.4, color: AppColor.black54),
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
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
                SizedBox(height: Get.height * 0.03),
                CustomTextFild(
                  validator: (value) {
                    if (globle.password.text.isEmpty) {
                      return "Please enter Password";
                    } else {
                      null;
                    }
                  },
                  obsertext: globle.tab,
                  hint: AppString.Password,
                  controller: globle.password,
                  leble: AppString.Password,
                  Icons: IconButton(
                    onPressed: () {
                      setState(() {
                        globle.tab = !globle.tab;
                      });
                    },
                    icon: Icon(
                      globle.tab == false ? Icons.visibility : Icons.visibility_off,
                      size: 30,
                      color: globle.tab == false ? AppColor.grey : AppColor.blue,
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                Row(
                  children: [
                    Checkbox(
                      value: globle.chacked,
                      onChanged: (value) {
                        setState(() {
                          globle.chacked = value!;
                        });
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        text: AppString.iagree,
                        style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(text: AppString.terms, style: TextStyle(color: AppColor.blue)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.06),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(SignInScreen());
                    },
                    child: RichText(
                      text: TextSpan(
                        text: AppString.already,
                        style: TextStyle(color: AppColor.black, fontSize: Get.width * 0.038),
                        children: [
                          TextSpan(
                            text: AppString.SignIn,
                            style: TextStyle(color: AppColor.blue, fontSize: Get.width * 0.04),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomContinue(top: Get.height * 0.05, bottom: Get.height * 0.04),
                SizedBox(height: Get.height * 0.09),
                CustomBtn(
                  text: AppString.signUP,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (globle.chacked == true) {
                        showDialog(
                          context: context,
                          builder: (context) => Padding(
                            padding: EdgeInsets.only(bottom: Get.height * 0.08),
                            child: AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              title: CustomPopup(text: AppString.signupsucess),
                            ),
                          ),
                        );
                        setState(() {
                          Future.delayed(Duration(seconds: 4)).then((value) => Get.off(HomePage()));
                        });
                        globle.email.clear();
                        globle.password.clear();
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}