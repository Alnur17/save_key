import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_key/common/app_text_style/styles.dart';

import '../../../../../../common/size_box/custom_sizebox.dart';

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 6.r, backgroundColor: color),
        sw5,
        Text(text, style: h5),
      ],
    );
  }
}
