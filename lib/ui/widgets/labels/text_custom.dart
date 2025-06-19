import 'package:consultant_app/styles/colors_app.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom({
    super.key,
    required this.titleFirst,
    required this.titleSecond,
    this.onTap,
  });
  final String titleFirst;
  final String titleSecond;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '$titleFirst '),

          TextSpan(
            text: titleSecond,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (onTap != null) {
                  onTap!();
                }
              },
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorsApp.textButtonColor,
            ),
          ),
        ],
      ),
    );
  }
}
