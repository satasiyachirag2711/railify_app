import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_page.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/presentation/widgets/custom_popup.dart';
import 'package:railify_app/presentation/widgets/custom_textfield.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_string.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
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
          child: SingleChildScrollView(
            child: Obx(() {
              return Column(
                children: [
                  Text(
                    AppString.createnew,
                    style: TextStyle(fontSize: Get.width * 0.06, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                    child: Text(
                      AppString.creatyournew,
                      style: TextStyle(fontSize: Get.width * 0.032, height: 1.4, color: AppColor.black54),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.025),
                  CustomTextFild(
                    validator: (value) {
                      if (globle.password.text.isEmpty) {
                        return "Please enter New Password";
                      } else {
                        null;
                      }
                      return null;
                    },
                    obsertext: globle.tab.value,
                    hint: AppString.Password,
                    controller: globle.password,
                    leble: AppString.newpassword,
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
                  ),
                  SizedBox(height: Get.height * 0.025),
                  CustomTextFild(
                    validator: (value) {
                      if (globle.password.text.isEmpty) {
                        return "Please enter Same Password";
                      } else if (globle.password.text != globle.confirmPassword.text) {
                        return "Please enter Same Password";
                      } else {
                        null;
                      }
                      return null;
                    },
                    obsertext: globle.tab.value,
                    hint: AppString.confirmnewpassword,
                    controller: globle.confirmPassword,
                    leble: AppString.confirmnewpassword,
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
                  ),
                ],
              );
            }),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomBtn(
            text: AppString.conti,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                showDialog(
                  context: context,
                  builder: (context) => Padding(
                    padding: EdgeInsets.only(bottom: Get.height * 0.08),
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      title: CustomPopup(text: AppString.resetpasswordsucces),
                    ),
                  ),
                );

                Future.delayed(const Duration(seconds: 4)).then((value) => Get.off(const HomePage()));

                globle.confirmPassword.clear();
                globle.password.clear();
              }
            },
          ),
        ),
      ),
    );
  }
}
