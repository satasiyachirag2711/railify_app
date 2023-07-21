import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/forgot_password/reset_password_screen.dart';
import 'package:railify_app/presentation/pages/home_page.dart';
import 'package:railify_app/presentation/pages/sign_up_screen.dart';
import 'package:railify_app/presentation/widgets/customNavigatebotam.dart';
import 'package:railify_app/presentation/widgets/custom_or_continue_with.dart';
import 'package:railify_app/presentation/widgets/custom_popup.dart';
import 'package:railify_app/presentation/widgets/custom_textfield.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_string.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                  AppString.welcome,
                  style: TextStyle(fontSize: Get.width * 0.06, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                  child: Text(
                    AppString.pleasenteremail,
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
                    return null;
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
                Obx(() {
                  return CustomTextFild(
                    validator: (value) {
                      if (globle.password.text.isEmpty) {
                        return "Please enter Password";
                      } else {
                        null;
                      }
                      return null;
                    },
                    obsertext: globle.tab.value,
                    hint: AppString.Password,
                    controller: globle.password,
                    leble: AppString.Password,
                    Icons: IconButton(
                      onPressed: () {
                        globle.tab.value = !globle.tab.value;
                      },
                      icon: Icon(
                        globle.tab.value == false ? Icons.visibility : Icons.visibility_off,
                        size: 30,
                        color: globle.tab.value == false ? AppColor.grey : AppColor.blue,
                      ),
                    ),
                  );
                }),
                SizedBox(height: Get.height * 0.01),
                Row(
                  children: [
                    Obx(
                      () {
                        return Checkbox(
                            value: globle.chacked.value,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            onChanged: (value) {
                              globle.chacked.value = value!;
                            });
                      },
                    ),
                    Text(
                      AppString.remember,
                      style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.04),
                    child: TextButton(
                      onPressed: () {
                        Get.to(const ResetPasswordScreen());
                        globle.email.clear();
                        globle.password.clear();
                      },
                      child: Text(
                        AppString.forgotpassword,
                        style: TextStyle(color: AppColor.blue, fontWeight: FontWeight.bold, fontSize: Get.width * 0.038),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const SignUpScreen());
                      globle.email.clear();
                      globle.password.clear();
                    },
                    child: RichText(
                      text: TextSpan(
                        text: AppString.donthave,
                        style: TextStyle(color: AppColor.black, fontSize: Get.width * 0.038),
                        children: [
                          TextSpan(
                            text: AppString.signUP,
                            style: TextStyle(color: AppColor.blue, fontSize: Get.width * 0.04),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomContinue(top: Get.height * 0.04, bottom: Get.height * 0.04),
                SizedBox(height: Get.height * 0.08),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBotamNavigate(
        text: AppString.SignIn,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            if (globle.chacked.value == true) {
              showDialog(
                context: context,
                builder: (context) => Padding(
                  padding: EdgeInsets.only(bottom: Get.height * 0.08),
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    title: CustomPopup(text: AppString.signinsucess),
                  ),
                ),
              );

              Future.delayed(const Duration(seconds: 4)).then((value) => Get.off(const HomePage()));

              globle.email.clear();
              globle.password.clear();
            }
          }
        },
      ),
    );
  }
}
