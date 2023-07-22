import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/shipping_rate/shipping_rate_screen.dart';
import 'package:railify_app/utils/app_color.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_string.dart';

class SelectOutletScreen extends StatefulWidget {
  const SelectOutletScreen({super.key});

  @override
  State<SelectOutletScreen> createState() => _SelectOutletScreenState();
}

class _SelectOutletScreenState extends State<SelectOutletScreen> {
  GlobleController globel = Get.find();

  @override
  void initState() {
    globel.shippingrate.addAll(AppList.shipping);
    super.initState();
  }

  void filterList(String searchText) {
    setState(() {
      searchText = searchText;
      globel.shippingrate = AppList.shipping.where((item) => item.toLowerCase().contains(searchText.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.selectoutlet),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: filterList,
              decoration: InputDecoration(
                hintText: AppString.searchoutletcity,
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: globel.shippingrate.length,
                itemBuilder: (context, index) {
                  final isSelected = globel.selectedIndices.contains(index);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          globel.selectedIndices.remove(index);
                        } else {
                          if (globel.selectedIndices.length < 2) {
                            globel.selectedIndices.add(index);
                          }
                          if (globel.selectedIndices.length == 2) {
                            final int firstSelectedIndex = globel.selectedIndices[0];
                            final int secondSelectedIndex = globel.selectedIndices[1];
                            Get.off(
                              ShipingRateScreen(
                                title: globel.shippingrate[firstSelectedIndex],
                                titleone: globel.shippingrate[secondSelectedIndex],
                              ),
                            );
                          }
                        }
                      });
                    },
                    child: ListTile(
                      tileColor: isSelected ? Colors.grey.shade200 : AppColor.white,
                      title: Text(globel.shippingrate[index], style: const TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: Text(AppList.subtitle[index], style: const TextStyle(height: 1.8)),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: Get.width * 0.045,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
