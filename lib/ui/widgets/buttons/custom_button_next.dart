import 'package:consultant_app/styles/colors_app.dart';
import 'package:flutter/material.dart';

class CustomButtonNext extends StatelessWidget {
  const CustomButtonNext({super.key, this.onTap, this.isEnable = true});
  final Function()? onTap;
  final bool? isEnable;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.textButtonColor,
        foregroundColor: ColorsApp.systemWhite,
        minimumSize: Size(340, 52),
      ),

      onPressed: isEnable! ? onTap : null,
      child: Text("Next"),
    );
  }
}
