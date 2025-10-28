import 'package:flutter/material.dart';

import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';

class DetailsWidget extends StatelessWidget {
  final String label;
  final String time;
  final String iconAsset;
  final double iconScale;
  final TextStyle? textStyle;

  const DetailsWidget({
    super.key,
    required this.label,
    required this.time,
    required this.iconAsset,
    this.iconScale = 4,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(iconAsset, scale: iconScale,color: AppColors.black,),
        sw8,
        Expanded(
          child: Text(
            label,
            style: textStyle ?? h5,
          ),
        ),
        Text(
          time,
          style: textStyle ?? h5,
        ),
      ],
    );
  }
}
