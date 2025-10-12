import 'package:flutter/material.dart';
import 'package:save_key/common/app_images/app_images.dart';

import '../app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';

class CustomRowHeader extends StatelessWidget {
  const CustomRowHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppImages.rightChecked,
          scale: 4,
        ),
        sw5,
        Text(
          title,
          style: h5,
        ),
      ],
    );
  }
}
