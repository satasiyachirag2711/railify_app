import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/food/food_select_payment_method.dart';
import 'package:railify_app/presentation/widgets/custom_btn.dart';
import 'package:railify_app/utils/app_color.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_string.dart';

class OrderFoodScreen extends StatefulWidget {
  final String title;
  final String image;
  final String subtitle;
  final String time;
  final String timetwo;
  final String date;

  const OrderFoodScreen({super.key, required this.title, required this.image, required this.subtitle, required this.time, required this.timetwo, required this.date});

  @override
  State<OrderFoodScreen> createState() => _OrderFoodScreenState();
}

class _OrderFoodScreenState extends State<OrderFoodScreen> {
  int selectedContainerIndex = -1;
  int selectedIndex = -1;
  List<int> selectedIndices = [];
  RxInt sum = 0.obs;
  GlobleController global = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppString.orderfood,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: Get.height * 0.08,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    if (selectedContainerIndex == index) {
                      // Unselect the currently selected container
                      selectedContainerIndex = -1;
                    } else {
                      // Select the tapped container
                      selectedContainerIndex = index;
                    }
                  });
                },
                child: Container(
                  width: Get.width * 0.2,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: selectedContainerIndex == index ? AppColor.blue : AppColor.blue,
                    ),
                    color: selectedContainerIndex == index ? AppColor.blue : null,
                  ),
                  child: Center(
                    child: Text(
                      AppString.female,
                      style: TextStyle(
                        color: selectedContainerIndex == index ? AppColor.white : AppColor.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
              height: Get.height * 1.6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(() {
                  return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => index == 0 || index == 5
                          ? Padding(padding: const EdgeInsets.symmetric(vertical: 20), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(index == 5 ? AppString.beveragesyoumay : AppString.ourrecommend, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.045)), const Icon(Icons.arrow_forward)]))
                          : SizedBox(height: Get.height * 0.03),
                      separatorBuilder: (context, index) => ListTile(
                          contentPadding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: BorderSide(color: selectedIndices.contains(index) ? AppColor.blue : AppColor.white)),
                          tileColor: AppColor.white,
                          title: Text("${global.demo[index]}* ${AppList.food[index]["dataOne"]}", style: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width * 0.038)),
                          leading: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset(AppList.food[index]["image"], scale: 0.8)),
                          subtitle: Text("\$${AppList.food[index]["dataTwo"]}", style: TextStyle(height: 2, fontSize: Get.width * 0.032, color: AppColor.blue)),
                          trailing: index == 0 || index == 1 || index == 5
                              ? Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: EdgeInsets.only(left: Get.width * 0.16),
                                  decoration: BoxDecoration(border: Border.all(color: AppColor.blue), borderRadius: BorderRadius.circular(10)),
                                  child: Text("New", style: TextStyle(color: AppColor.blue, fontWeight: FontWeight.w500, fontSize: Get.width * 0.032)),
                                )
                              : SizedBox(width: Get.width * 0.2),
                          onTap: () {
                            setState(() {
                              if (selectedIndices.contains(index)) {
                                selectedIndices.remove(index);
                              } else {
                                selectedIndices.add(index);
                              }
                            });
                            debugPrint("=================$index");
                            showModalBottomSheet(
                                elevation: 0,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) => Container(
                                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                    padding: const EdgeInsets.all(25),
                                    decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(Get.width * 0.1)),
                                    height: Get.height * 1,
                                    child: SingleChildScrollView(child: Obx(() {
                                      return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                            AppList.food[index]["image"], // Add the image path here
                                            fit: BoxFit.cover,
                                            width: Get.width * 0.9,
                                            height: Get.height * 0.45,
                                          ),
                                        ),
                                        Text(AppList.food[index]["dataOne"], style: TextStyle(fontWeight: FontWeight.w500, height: 2, fontSize: Get.width * 0.048)),
                                        Text(AppString.ourspecialburger, style: TextStyle(height: 1.5, fontSize: Get.width * 0.05, color: AppColor.black54)),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: Get.width * 0.03),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (global.number.value > 0) {
                                                        global.number.value--;
                                                        global.total.value = double.parse(AppList.food[index]["dataTwo"]) * global.number.value;
                                                        debugPrint("============================$index");
                                                        global.demo[index] = global.number.value.toInt();
                                                        debugPrint("${global.demo}");
                                                      }
                                                    });
                                                  },
                                                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue.shade50), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                                                  child: Text(
                                                    "-",
                                                    style: TextStyle(color: AppColor.blue, fontSize: Get.width * 0.07, fontWeight: FontWeight.bold),
                                                  )),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                                                child: Text(global.number.value.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04)),
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      global.number.value++;
                                                      global.total.value = double.parse(AppList.food[index]["dataTwo"]) * global.number.value;
                                                      debugPrint("=====================$index");
                                                      global.demo[index] = global.number.value.toInt();
                                                      debugPrint("${global.demo}");
                                                    });
                                                  },
                                                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue.shade50), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                                                  child: Text(
                                                    "+",
                                                    style: TextStyle(color: AppColor.blue, fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: Get.height * 0.1,
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
                                          child: TextField(
                                            controller: global.note,
                                            decoration: const InputDecoration(border: InputBorder.none, hintText: "Note to Chef (Optional)"),
                                            maxLines: 2,
                                          ),
                                        ),
                                        SizedBox(height: Get.height * 0.03),
                                        CustomBtn(
                                          text: "Add To Basket-\$${global.total.value}",
                                          onPressed: () {
                                            Get.back();
                                          },
                                        )
                                      ]);
                                    }))));
                          }),
                      itemCount: AppList.food.length);
                }),
              ))
        ])),
        bottomNavigationBar: BottomAppBar(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: CustomBtn(
                  text: "Basket ${item()}items-\$${totalprice().toStringAsFixed(2)}",
                  onPressed: () {
                    global.basket.clear();
                    for (int i = 0; i < selectedIndices.length; i++) {
                      global.basket.add(AppList.food[i]);
                    }

                    debugPrint("${global.basket}");
                    Get.to(FoodSelectPaymentMethod(food: global.basket, total: totalprice().toStringAsFixed(2), image: widget.image, title: widget.title, date: widget.date, timeone: widget.time, timetwo: widget.timetwo, subtitle: widget.subtitle));
                  },
                ))));
  }

  double totalprice() {
    double totalPrice = 0;
    for (int index in selectedIndices) {
      double price = double.parse(AppList.food[index]["dataTwo"]);
      totalPrice += price * global.demo[index];
    }
    return totalPrice;
  }

  int item() {
    int sum = 0;
    for (int index in selectedIndices) {
      sum += global.demo[index];
    }
    return sum;
  }
}
