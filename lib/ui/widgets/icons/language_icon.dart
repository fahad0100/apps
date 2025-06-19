import 'package:consultant_app/styles/colors_app.dart';
import 'package:flutter/material.dart';

class LanguageIcon extends StatelessWidget {
  const LanguageIcon({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Icon(Icons.language, color: ColorsApp.textButtonColor),
    );
  }
}
