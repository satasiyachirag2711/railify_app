import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/presentation/pages/home_widgets/home_widgets.dart';
import 'package:railify_app/presentation/pages/ticket/ticket_screen.dart';
import 'package:railify_app/presentation/pages/wallet/wallet_screen.dart';
import 'package:railify_app/presentation/widgets/custom_bottem_bar.dart';

import 'account/account_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobleController globle = Get.put(GlobleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return globle.navigation.value == 0
            ? const HomeWigets()
            : globle.navigation.value == 1
                ? const TicketScreen()
                : globle.navigation.value == 2
                    ? const WalletScreen()
                    : globle.navigation.value == 3
                        ? AccountScreen()
                        : Container();
      }),
      bottomNavigationBar: Obx(() {
        return BottomAppBar(
          child: CustomBottomBar(
            index: globle.navigation.value,
            funcOne: () {
              globle.navigation.value = 0;
            },
            funcTwo: () {
              globle.navigation.value = 1;
            },
            funcThree: () {
              globle.navigation.value = 2;
            },
            fucFour: () {
              globle.navigation.value = 3;
            },
          ),
        );
      }),
    );
  }
}
