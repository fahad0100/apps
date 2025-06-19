import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({super.key, this.isHeadLine = false, required this.title});
  final bool? isHeadLine;
  final String title;

  @override
  Widget build(BuildContext context) {
    TextStyle? styleCustom;
    if (isHeadLine == true) {
      styleCustom = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    } else {
      styleCustom = TextStyle(fontSize: 14, fontWeight: FontWeight.w700);
    }
    return Text(title, style: styleCustom);
  }
}
