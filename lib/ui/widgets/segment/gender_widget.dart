import 'package:consultant_app/ui/widgets/labels/custom_label.dart';
import 'package:consultant_app/ui/widgets/segment/part_gender_widget.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({super.key, this.selected, this.onTapSelect});
  final int? selected;
  final Function(int)? onTapSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(title: "Gender", isHeadLine: false),
        SizedBox(height: 18),
        Row(
          spacing: 8,
          children: [
            InkWell(
              splashFactory: NoSplash.splashFactory,

              splashColor: Colors.transparent,
              // borderRadius: BorderRadius.circular(15),
              onTap: () {
                if (onTapSelect != null) {
                  onTapSelect!(1);
                }
              },
              child: PartGenderWidget(
                title: 'Male',
                isSelected: selected == 1 ? true : false,
              ),
            ),
            InkWell(
              onTap: () {
                if (onTapSelect != null) {
                  onTapSelect!(2);
                }
              },
              child: PartGenderWidget(
                title: 'Female',
                isSelected: selected == 2 ? true : false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
