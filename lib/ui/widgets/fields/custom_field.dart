import 'package:consultant_app/styles/colors_app.dart';
import 'package:consultant_app/ui/widgets/labels/custom_label.dart';
import 'package:consultant_app/utils/extension/screen.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

enum StatusValidationCustoMField { nano, pass, error }

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    this.withExt = false,
    required this.title,
    required this.statusValidation,
    this.hintExt,
    required this.hintField,
    this.formKey,
    this.onChange,
    this.controller,
  });
  final bool? withExt;
  final String title;
  final String? hintExt;
  final String hintField;
  final StatusValidationCustoMField statusValidation;
  final Key? formKey;
  final String? Function(String?)? onChange;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    Widget? iconValidation;
    if (statusValidation == StatusValidationCustoMField.pass) {
      iconValidation = Icon(
        Icons.check_circle_outline,
        color: ColorsApp.systemGreen,
      );
    }
    if (statusValidation == StatusValidationCustoMField.error) {
      iconValidation = Icon(Icons.error, color: ColorsApp.systemRed);
    }
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400, maxHeight: 84),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomLabel(title: title),
          SizedBox(height: 8),
          Row(
            children: [
              if (withExt!)
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          CountryFlag.fromCountryCode(
                            'SA',
                            height: context.getSizeWidth(size: 0.07),
                            width: context.getSizeWidth(size: 0.07),

                            shape: const Circle(),
                          ),
                          Text(hintExt ?? ""),
                        ],
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),

              if (withExt!) SizedBox(width: 4),
              Expanded(
                flex: 5,
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    onTapOutside: (event) {
                      return FocusManager.instance.primaryFocus?.unfocus();
                    },
                    onChanged: onChange,
                    controller: controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: hintField,
                      suffixIcon: iconValidation,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
