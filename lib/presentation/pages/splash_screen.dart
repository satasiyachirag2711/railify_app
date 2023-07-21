import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:railify_app/presentation/pages/intro_screen.dart';

import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../../utils/app_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3)).then((value) => Get.off(const IntroScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.train_logo, scale: 7),
                  Text(
                    AppString.Railify,
                    style: TextStyle(fontSize: Get.width * 0.06, height: 3, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Get.height * 0.12),
              child: SpinKitCircle(
                size: Get.width * 0.15,
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(color: AppColor.blue, shape: BoxShape.circle),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
