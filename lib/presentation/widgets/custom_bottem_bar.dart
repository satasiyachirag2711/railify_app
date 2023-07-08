import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:railify_app/utils/app_color.dart';
import 'package:railify_app/utils/app_images.dart';

class CustomBottomBar extends StatelessWidget {
  final Function funcOne;
  final Function funcTwo;
  final Function funcThree;
  final Function fucFour;

  final int index;

  const CustomBottomBar({
    Key? key,
    required this.funcOne,
    required this.funcTwo,
    required this.funcThree,
    required this.fucFour,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.085,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.grey.withOpacity(0.7),
            blurRadius: 10,
            offset: const Offset(7, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: bottomBtn(
              textLabel: "Home",
              onTap: () {
                funcOne();
              },
              index: index,
              lightIcon: AppImages.hom,
              color: index == 0 ? AppColor.blue : AppColor.grey,
              textColor: index == 0 ? AppColor.blue : AppColor.grey,
            ),
          ),
          Expanded(
            child: bottomBtn(
                textLabel: "My Ticket",
                onTap: () {
                  funcTwo();
                },
                index: index,
                lightIcon: AppImages.ticket,
                color: index == 1 ? AppColor.blue : AppColor.grey,
                textColor: index == 1 ? AppColor.blue : AppColor.grey),
          ),
          Expanded(
            child: bottomBtn(
              textLabel: "My Wallet",
              onTap: () {
                funcThree();
              },
              index: index,
              lightIcon: AppImages.wallet,
              color: index == 2 ? AppColor.blue : AppColor.grey,
              textColor: index == 2 ? AppColor.blue : AppColor.grey,
            ),
          ),
          Expanded(
            child: bottomBtn(
              textLabel: "Account",
              onTap: () {
                fucFour();
              },
              index: index,
              lightIcon: AppImages.user,
              color: index == 3 ? AppColor.blue : AppColor.grey,
              textColor: index == 3 ? AppColor.blue : AppColor.grey,
            ),
          ),
        ],
      ),
    );
  }
}

Widget bottomBtn({
  required Function onTap,
  required int index,
  required String lightIcon,
  required Color color,
  required Color textColor,
  required String textLabel,
}) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      onTap();
    },
    child: Container(
      height: Get.height * 0.1,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03, vertical: Get.height * 0.014),
      child: Column(
        children: [
          Image.asset(
            lightIcon,
            fit: BoxFit.cover,
            height: Get.height * 0.029,
            color: color,
          ),
          SizedBox(height: Get.height * 0.005),
          Text(
            textLabel,
            style: TextStyle(
              fontSize: Get.width * 0.033,
              color: textColor,
            ),
          ),
        ],
      ),
    ),
  );
}
