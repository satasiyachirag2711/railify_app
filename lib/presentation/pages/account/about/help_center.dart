import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  final String name;
  const AboutScreen({super.key, required this.name});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
    );
  }
}
