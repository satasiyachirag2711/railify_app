import 'package:flutter/material.dart';

import 'custom_btn.dart';

class CustomBotamNavigate extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomBotamNavigate({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomBtn(
          text: text,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
