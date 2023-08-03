import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:railify_app/presentation/pages/ticket/ticket_active_screen.dart';
import 'package:railify_app/presentation/pages/ticket/ticket_canceled_screen.dart';
import 'package:railify_app/presentation/pages/ticket/tickets_complected_screen.dart';
import 'package:railify_app/utils/app_string.dart';

import '../../../utils/app_color.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.myticket),
        centerTitle: true,
        leading: const Icon(Icons.train),
      ),
      body: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: AppColor.grey,
                  indicatorWeight: 4,
                  labelStyle: TextStyle(
                    fontSize: Get.width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: [
                    Tab(
                      text: (AppString.active),
                    ),
                    Tab(
                      text: (AppString.completed),
                    ),
                    Tab(
                      text: (AppString.canceled),
                    )
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      TicketActiveScreen(),
                      TicketsComplectedScreen(),
                      TicketCancelSceen(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
