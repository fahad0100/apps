import 'dart:async';

import 'package:consultant_app/styles/colors_app.dart';
import 'package:consultant_app/ui/widgets/labels/custom_label.dart';
import 'package:consultant_app/ui/widgets/labels/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pinput/pinput.dart';

class VerifyOtpSheet extends StatefulWidget {
  final String? emailOrPhone;
  final VoidCallback? onFinishTimer;
  final Function(String)? onCompleted;
  final OtpTimerButtonController controllerResend;
  final Function()? onTapResend;
  final int? timeResend;
  const VerifyOtpSheet({
    super.key,
    required this.emailOrPhone,
    this.onFinishTimer,
    required this.onCompleted,
    required this.controllerResend,
    this.onTapResend,
    this.timeResend = 3,
  });

  @override
  State<VerifyOtpSheet> createState() => _VerifyOtpSheetState();
}

class _VerifyOtpSheetState extends State<VerifyOtpSheet> {
  bool displayResendButton = false;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: widget.timeResend! + 1), (value) {
      displayResendButton = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: 300,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          color: ColorsApp.systemWhite,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomLabel(title: "OTP ", isHeadLine: true),
              Column(
                children: [
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: "Please Enter the code sent to "),
                        TextSpan(
                          text: widget.emailOrPhone ?? "*******",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Pinput(
                    length: 6,
                    defaultPinTheme: PinTheme(
                      height: 50,
                      width: 44,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      height: 50,
                      width: 44,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorsApp.textButtonColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onCompleted: widget.onCompleted,
                  ),
                  const SizedBox(height: 32),
                  if (displayResendButton)
                    TextCustom(
                      titleFirst: 'Did not receive it? ',
                      titleSecond: 'Resend',
                      onTap: () async {
                        if (widget.onTapResend != null) {
                          displayResendButton = false;
                          widget.controllerResend.startTimer();
                          setState(() {});
                        }
                      },
                    ),
                  const SizedBox(height: 8),
                  OtpTimerButton(
                    controller: widget.controllerResend,
                    buttonType: ButtonType.text_button,
                    onPressed: () {},
                    text: Text(''),
                    duration: widget.timeResend!,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
