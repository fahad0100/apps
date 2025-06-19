import 'package:consultant_app/styles/colors_app.dart';
import 'package:consultant_app/utils/extension/screen.dart';
import 'package:flutter/material.dart';

class PartGenderWidget extends StatelessWidget {
  const PartGenderWidget({
    super.key,
    required this.title,
    this.isSelected = false,
  });
  final String title;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getSizeWidth(size: 0.08),
      width: context.getSizeWidth(size: 0.23),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isSelected! ? ColorsApp.textButtonColor : Colors.grey,
          width: isSelected! ? 1.5 : 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }
}
