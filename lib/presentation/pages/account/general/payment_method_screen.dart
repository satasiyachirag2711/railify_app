import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:railify_app/controller/globle_controller.dart';
import 'package:railify_app/utils/app_images.dart';

import '../../../../utils/App_list.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_btn.dart';
import '../../../widgets/custom_textfield.dart';

class PaymentMethodScreen extends StatefulWidget {
  final String name;
  String? payment;
  PaymentMethodScreen({super.key, required this.name, this.payment});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  GlobleController globle = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    if (AppList.paymentmethod.isEmpty) {
      AppList.paymentmethod = [
        Map<String, String>.from({"image": AppImages.paymentnew, "dataOne": widget.payment.toString()})
      ] as RxList<Map<String, dynamic>>;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: AppList.paymentmethod.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05, vertical: Get.height * 0.01),
          child: Center(
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              leading: Image.asset(AppList.paymentmethod[index]["image"], scale: 14),
              tileColor: AppColor.white,
              title: Text(AppList.paymentmethod[index]["dataOne"], style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold)),
              trailing: Text("Connected", style: TextStyle(color: AppColor.blue, fontWeight: FontWeight.w500)),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomBtn(
            text: "+  Add New Payment",
            onPressed: () {
              globle.cardnumber.clear();
              Get.to(const AddNewPayment());
            },
          ),
        ),
      ),
    );
  }
}

class AddNewPayment extends StatefulWidget {
  const AddNewPayment({super.key});

  @override
  State<AddNewPayment> createState() => _AddNewPaymentState();
}

class _AddNewPaymentState extends State<AddNewPayment> {
  GlobleController globle = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(AppString.addnewpayment, style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [Icon(Icons.document_scanner)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppImages.paymentnew,
                height: Get.height * 0.25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomTextFild(
                  hint: AppString.cardholder,
                  controller: TextEditingController(),
                  leble: AppString.cardholder,
                ),
              ),
              CustomTextFild(
                maxlength: 16,
                hint: AppString.cardnumber,
                controller: globle.cardnumber,
                leble: AppString.cardnumber,
                numberKeyboard: true,
              ),
              TextField(
                controller: globle.date,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        selectDate(context);
                      },
                      icon: const Icon(Icons.calendar_month)),
                  hintText: AppString.expirydate,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: AppColor.black),
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomTextFild(
                maxlength: 3,
                numberKeyboard: true,
                hint: AppString.cvv,
                controller: TextEditingController(),
                leble: AppString.cvv,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomBtn(
              onPressed: () {
                Get.off(PaymentMethodScreen(
                  name: "",
                  payment: globle.cardnumber.text,
                ));
              },
              text: AppString.save),
        ),
      ),
    );
  }

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      globle.date.text = DateFormat("dd/MM/yyyy").format(picked);
    }
  }
}
